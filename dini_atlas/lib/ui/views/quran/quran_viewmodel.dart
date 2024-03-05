import 'package:audioplayers/audioplayers.dart';
import 'package:dini_atlas/app/app.dialogs.dart';
import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/app/app.router.dart';
import 'package:dini_atlas/models/content_type.dart';
import 'package:dini_atlas/models/favourite.dart';
import 'package:dini_atlas/models/quran/ayah_list.dart';
import 'package:dini_atlas/models/quran/quran_reciter.dart';
import 'package:dini_atlas/models/quran/sura_info.dart';
import 'package:dini_atlas/models/quran/sura_player.dart';
import 'package:dini_atlas/models/user_setting.dart';
import 'package:dini_atlas/services/local/favorites_service.dart';
import 'package:dini_atlas/services/local/user_settings_service.dart';
import 'package:dini_atlas/services/remote/google/admob_service.dart';
import 'package:dini_atlas/services/remote/quran_service.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/dialogs/settings/settings_quran_dialog.dart';
import 'package:dini_atlas/ui/views/home/tabs/quran/quran_tab_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class QuranViewModel extends BaseViewModel {
  final _player = AudioPlayer();
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _quranService = locator<QuranService>();
  final _userSettingsService = locator<UserSettingsService>();
  final _favouritesService = locator<FavouritesService>();

  final _bannerAd = AdmobBannerAdService(adUnitId: ksAdmobBanner2);
  BannerAd? get bannerAd => _bannerAd.bannerAd;
  void _loadBannerAd() => _bannerAd.loadAd(onAdLoaded: () => notifyListeners());

  final _interstitialAdService =
      AdmobInterstitialAdService(adUnitId: ksAdmobInterstitial2);
  void _loadInterstitalAd() => _interstitialAdService.loadAd();

  void _showInterstitalAd() {
    final interstitialAd = _interstitialAdService.interstitialAd;
    if (interstitialAd != null) interstitialAd.show();
  }

  List<Favourite>? _favourites;
  List<Favourite>? get favourites => _favourites;
  Favourite getFavByAyahId(int ayahId) => favourites!.singleWhere(
      (e) => e.number == ayahId && e.type == EContentTypes.ayet.name);
  bool isInFavourites(int ayahId) =>
      favourites?.any((e) => e.number == ayahId && e.name == _suraInfo.name) ??
      false;

  late UserSettings _userSettings;
  UserSettings get userSettings => _userSettings;

  AyahList? _ayahList;
  AyahList? get ayahList => _ayahList;

  List<QuranReciter> _quranReciters = [];
  List<QuranReciter> get quranReciters => _quranReciters;

  int _currentOffset = 0;

  bool _loadMoreStatus = false;
  bool get loadMoreStatus => _loadMoreStatus;

  void _setLoadMoreStatus(bool status) {
    _loadMoreStatus = status;
    notifyListeners();
  }

  bool _endOfContent = false;

  int _playingAyahId = -1;
  int get playingAyahId => _playingAyahId;
  set playingAyahId(int id) {
    _playingAyahId = id;
    notifyListeners();
  }

  bool isPlayingAyahId(int ayahId) =>
      currentPlayerState == PlayerState.playing && playingAyahId == ayahId;

  // İlk oynatma için değeri true olarak tut. Oynatma başlayınca false yap
  // Otomatik Oynama Ayarı [kapalı] ise ilk oynatma değeri false olduğunda durdurmak içindir.
  bool _isFirstPlaying = true;

// Surenin player url'i ve takip bilgilerini tutar
  SuraPlayer? _suraPlayerModel;

  QuranReciter quranReciterById(int id) =>
      quranReciters.singleWhere((e) => e.id == id);

  PlayerState _currentPlayerState = PlayerState.stopped;
  PlayerState get currentPlayerState => _currentPlayerState;

  late SuraInfo _suraInfo;

  void init({required SuraInfo sura, int? ayah}) async {
    _suraInfo = sura;
    _loadBannerAd();
    _loadInterstitalAd();
    await runBusyFuture(getUserSettings());
    runBusyFuture(getAyahList(suraId: sura.suraId, ayahId: ayah));
    runBusyFuture(_getQuranRecitersList());
    runBusyFuture(_getFavourites());
    _playerListener();
  }

  Future<void> getUserSettings() async => await _userSettingsService
      .getUserSettings()
      .then((value) => _userSettings = value!);

  Future<void> getAyahList(
      {required int suraId, int? ayahId, bool loadMore = false}) async {
    if (loadMore) {
      // Zaten yükleniyorsa veya daha fazla veri yoksa iptal et
      if (_loadMoreStatus || _endOfContent) return;
      _setLoadMoreStatus(true);
      // Kaydırdıkça yükleme ise 10 tane daha veri iste
      _currentOffset += 10;
    }

    // Veriyi getir, eğer loadMore ise offset değerini gönder
    final result = await _quranService.getSuraAyahList(
        suraId: suraId, ayah: ayahId, offset: loadMore ? _currentOffset : 0);

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
    if (_userSettings.quranReciterId == -1) {
      await _userSettingsService
          .setQuranReciter(quranReciters.first.id)
          .then((value) => _userSettings = value);
      notifyListeners();
    }
  }

  void _scrollToAyah(int ayahId) {
    final currentContext = GlobalObjectKey(ayahId).currentContext;
    if (currentContext == null) return;
    Scrollable.ensureVisible(currentContext,
        duration: const Duration(milliseconds: 300),
        alignment: 0.5,
        curve: Curves.easeInOutCubic);
  }

  void _playerListener() async {
    // Player süresi değişikliklerini dinle
    _player.onPositionChanged.listen((duration) {
      if (_suraPlayerModel == null) return;
      // Oynatılan sesin ayetini bul
      final ayahItem = _suraPlayerModel!.pages
          .lastWhere((e) => e.startTime <= duration.inMilliseconds);
      // Farklı bir ayet okunuyorsa state'i güncelle
      if (ayahItem.ayah != _playingAyahId) {
        // Eğer ilk oynatma değilse, otomatik oynatma değeri kapalıysa ve
        // Sıra diğer ayete gelmişse, oynatıcıyı durdur
        final bool autoChange = userSettings.suraSetting.playerAutoChange;
        if (!autoChange && !_isFirstPlaying && _playingAyahId != 0) {
          pauseAudioPlayer();
        } else {
          // State'i sıradaki ayete güncelle
          _playingAyahId = ayahItem.ayah;
          notifyListeners();
          // Oynatılan ayet görünümüne kaydır
          _scrollToAyah(playingAyahId);
        }
      }
    });
    // Oynatıcı durumunu dinle (durdu / başladı gibi)
    _player.onPlayerStateChanged.listen((state) {
      // Durum değişince state'i güncelle
      _currentPlayerState = state;
      notifyListeners();
    });
  }

  void playSura(AyahModel ayahModel) async {
    if (quranReciters.isEmpty) return;
    _isFirstPlaying = true;
    playingAyahId = ayahModel.ayet; // State'i değiştir
    setBusyForObject(playingAyahId, true);
    final currentReciterId = _userSettings.quranReciterId;
    final result =
        await _quranService.getSuraAudio(quranReciterById(currentReciterId));

    await result.fold((suraAudios) async {
      // Mevcut sure adresini getir
      final currentAudio =
          suraAudios.items.singleWhere((e) => e.suraId == ayahModel.sure);
      // Player çalışıyorsa durdur
      if (_player.state == PlayerState.playing) await _player.stop();

      // Sureye ait ses dosyasını ve takip sırasını getir
      final playerResult = await _quranService.getSuraPlayer(currentAudio.url);

      await playerResult.fold((l) async {
        _suraPlayerModel = l;
        await _playSuraWithSpesificPosition(ayahModel);
        // Oynatma sonrasında otomatik oynatmayı kontrol altında tutmak için
        _isFirstPlaying = false;
      }, (e) async => debugPrint(e.message));
    }, (e) async {
      debugPrint(e.message);
      await _bottomSheetService.showBottomSheet(
        title: "Sorun oldu 🙁",
        description:
            "Seçili okuyucunun verilerine şuanda ulaşılamıyor. Başka bir okuyucu seçer misiniz?",
        confirmButtonTitle: "Seç",
      );
      onSettingsTap();
    });

    setBusyForObject(playingAyahId, false);
  }

  Future<void> _playSuraWithSpesificPosition(AyahModel ayahModel) async {
    if (_suraPlayerModel case final SuraPlayer suraPlayerModel) {
      // Ayeti bul
      final ayah =
          suraPlayerModel.pages.singleWhere((e) => e.ayah == ayahModel.ayet);
      // Ayeti player ile oynat
      await _player.play(UrlSource(suraPlayerModel.audio));
      // Ayet sesin hangi saniyesindeyse oynatıcıyı oraya kaydır
      await _player.seek(Duration(milliseconds: ayah.startTime));
      // Oynatılan ayet görünümüne kaydır
      _scrollToAyah(ayahModel.ayet);
    }
  }

  void pauseAudioPlayer() async {
    if (_player.state == PlayerState.playing) {
      await _player.pause();
      playingAyahId = -1;
    }
  }

  Future<void> _getFavourites() async {
    _favourites = await _favouritesService.getFavourites();
    notifyListeners();
  }

  Future<void> onBookmarkTap(AyahModel ayahModel) async {
    if (isInFavourites(ayahModel.ayet)) {
      /// Favorilerden sil
      // Kayıtlı modeli getir
      final Favourite fav = getFavByAyahId(ayahModel.ayet);
      await _favouritesService.deleteFavourite(id: fav.id, name: fav.name);
      _favourites?.remove(fav);
      notifyListeners();
    } else {
      /// Favorilere ekle
      // Nesne oluştur
      final fav = Favourite()
        ..name = _suraInfo.name
        ..number = ayahModel.ayet
        ..text1 = ayahModel.textAr
        ..text2 = ayahModel.textOkunus
        ..text3 = ayahModel.textMeal
        ..type = EContentTypes.ayet.name;
      // Klasör seçmesi için favoriler ekranına gönder
      final result =
          await _navigationService.navigateToFavouritesView(favourite: fav);
      // Klasör seçimi sonrası gelen klasör ismiyle kayıt oluştur
      if (result is String) {
        _showInterstitalAd();
        await _favouritesService.addFavourite(fav..folder = result);
        _bottomSheetService.showBottomSheet(
          title: "Favorilere eklendi.",
          description: "$result isimli klasöre kaydedildi.",
          confirmButtonTitle: "Tamam",
        );
      }
      // Kayıt sonrası favorileri tekrar getir
      _getFavourites();
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
        suraSetting: _userSettings.suraSetting.copyWith(),
        currentReciterId: _userSettings.quranReciterId,
        currentFontSizeIncreaseValue: _userSettings.increaseAyahFontSize,
        onSelectedReciter: (reciter) {
          _userSettingsService
              .setQuranReciter(reciter.id)
              .then((value) => _userSettings = value);
        },
        onSuraSettingChanged: (suraSetting) {
          _userSettingsService.setSuraSettings(suraSetting).then((value) {
            _userSettings = value;
            notifyListeners();
          });
        },
        onFontSizeChanged: (v) {
          _userSettingsService.setIncreaseFontSizeForAyah(v).then((value) {
            _userSettings = value;
            notifyListeners();
          });
        },
      ),
    );
  }

  SavedLastAyah get _lastReadAyah => _userSettings.savedLastAyah;

  bool isLastReadAyah(AyahModel ayahModel) =>
      _lastReadAyah.ayah == ayahModel.ayet &&
      _lastReadAyah.suraId == ayahModel.sure;

  void saveAyahAsLastRead(AyahModel ayahModel) async {
    if (isLastReadAyah(ayahModel)) return;
    _userSettings = await _userSettingsService.setLastReadAyah(
      SavedLastAyah()
        ..ayah = ayahModel.ayet
        ..sura = ayahList!.sure.isim
        ..suraId = ayahModel.sure,
    );
    notifyListeners();
    _bottomSheetService.showBottomSheet(
      title: "İşaret koyuldu",
      description: "Son okunan ayet olarak işaretlendi.",
      confirmButtonTitle: "Tamam",
    );
  }

  bool _showHashInputView = false;
  bool get showHastInputView => _showHashInputView;

  void toggleHashInputView() {
    _showHashInputView = !_showHashInputView;
    notifyListeners();
  }

  void onHashInputSubmit(String input) {
    toggleHashInputView();
    if (input.isEmpty) return;
    final max = ayahList?.sure.ayetSayisi;

    final number = int.tryParse(input);
    if (number == null || number > max! || number.isNegative) {
      _bottomSheetService.showBottomSheet(
        title: "Yanlış İstek",
        description: "Gitmek istediğiniz ayeti 1-$max aralığında giriniz.",
        confirmButtonTitle: "Tamam",
      );
    } else {
      _navigationService.back();
      // Sayfayı kapat ve istenilen sayfayı aç
      _navigationService.navigateToQuranView(
        currentTab: QuranTabs.sura,
        sura: _suraInfo,
        ayah: number,
      );
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
