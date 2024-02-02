import 'package:dini_atlas/app/app.dialogs.dart';
import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/models/quran/ayah_list.dart';
import 'package:dini_atlas/models/quran/quran_reciter.dart';
import 'package:dini_atlas/models/quran/sura_info.dart';
import 'package:dini_atlas/services/local/user_settings_service.dart';
import 'package:dini_atlas/services/remote/quran_service.dart';
import 'package:dini_atlas/ui/dialogs/settings/settings_quran_dialog.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class QuranViewModel extends BaseViewModel {
  final _quranService = locator<QuranService>();
  final _userSettingsService = locator<UserSettingsService>();
  AyahList? _ayahList;
  List<QuranReciter> _quranReciters = [];
  int _currentReciterId = -1;
  int _currentOffset = 0;
  bool _loadMoreStatus = false;
  bool _endOfContent = false;

  AyahList? get ayahList => _ayahList;
  bool get loadMoreStatus => _loadMoreStatus;
  List<QuranReciter> get quranReciters => _quranReciters;
  QuranReciter quranReciterById(int id) =>
      quranReciters.singleWhere((e) => e.id == id);

  void init(SuraInfo sura) {
    runBusyFuture(getAyahList(suraId: sura.suraId));
    runBusyFuture(_getQuranRecitersList());
  }

  void _setLoadMoreStatus(bool status) {
    _loadMoreStatus = status;
    notifyListeners();
  }

  Future<void> getAyahList({required int suraId, bool loadMore = false}) async {
    if (loadMore) {
      // Zaten yükleniyorsa veya daha fazla veri yoksa iptal et
      if (_loadMoreStatus || _endOfContent) return;
      _setLoadMoreStatus(true);
      // Kaydırdıkça yükleme ise 10 tane daha veri iste
      _currentOffset += 10;
    }

    // Veriyi getir, eğer loadMore ise offset değerini gönder
    final result = await _quranService.getSuraAyahList(
        suraId: suraId, offset: loadMore ? _currentOffset : 0);

    _setLoadMoreStatus(false);

    result.fold((data) {
      // Eğer ilk yükleme ise veriyi direkt kaydet
      if (!loadMore) {
        _ayahList = data;
      } else {
        // Eğer kaydırdıkça yükleme ise verinin üzerine ekleme yap
        _ayahList?.ayetler.addAll(data.ayetler);
        // Gelen veri boşsa yüklenecek birşey yok demektir
        if (data.ayetler.isEmpty) _endOfContent = true;
      }
      notifyListeners();
    }, (error) {
      setError(error.message);
    });
  }

  Future<void> _getQuranRecitersList() async {
    // Kuran okuyucu listesini getir
    final result = await _quranService.getQuranReciters();
    result.fold((data) {
      // Veriyi kaydet
      _quranReciters = data;
      notifyListeners();
    }, (error) {
      setError(error.message);
    });
    // Kullanıcı ayarlarından kayıtlı reciterId'i getir
    final userSettings = await _userSettingsService.getUserSettings();
    _currentReciterId = userSettings!.quranReciterId;
    if (_currentReciterId == -1) {
      await _userSettingsService.setQuranReciter(quranReciters.first.id);
      _currentReciterId = quranReciters.first.id;
    }
  }

  void showSuraInfo() {
    final SuraDetailedInfo info = _ayahList!.sure;
    locator<BottomSheetService>().showBottomSheet(
      title: info.isim,
      description:
          "${info.aciklama} Sure ${info.sayfa}. sayfada yer almaktadır.",
      confirmButtonTitle: "Kapat",
    );
  }

  void onSettingsTap() async {
    if (_quranReciters.isEmpty) return;
    locator<DialogService>().showCustomDialog(
      variant: DialogType.settings,
      title: "Sûre",
      data: SettingsQuranDialog(
        quranReciters: quranReciters,
        currentReciterId: _currentReciterId,
        onSelectedReciter: (reciter) {
          _userSettingsService.setQuranReciter(reciter.id);
        },
      ),
    );
  }
}
