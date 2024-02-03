import 'package:audioplayers/audioplayers.dart';
import 'package:dini_atlas/app/app.dialogs.dart';
import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/models/quran/ayah_list.dart';
import 'package:dini_atlas/models/quran/quran_reciter.dart';
import 'package:dini_atlas/models/quran/sura_info.dart';
import 'package:dini_atlas/models/quran/sura_player.dart';
import 'package:dini_atlas/models/user_setting.dart';
import 'package:dini_atlas/services/local/user_settings_service.dart';
import 'package:dini_atlas/services/remote/quran_service.dart';
import 'package:dini_atlas/ui/dialogs/settings/settings_quran_dialog.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class QuranViewModel extends BaseViewModel {
  final _player = AudioPlayer();
  final _quranService = locator<QuranService>();
  final _userSettingsService = locator<UserSettingsService>();

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

// Surenin player url'i ve takip bilgilerini tutar
  SuraPlayer? _suraPlayerModel;

  QuranReciter quranReciterById(int id) =>
      quranReciters.singleWhere((e) => e.id == id);

  PlayerState _currentPlayerState = PlayerState.stopped;
  PlayerState get currentPlayerState => _currentPlayerState;

  void init(SuraInfo sura) async {
    await runBusyFuture(getUseSettings());
    runBusyFuture(getAyahList(suraId: sura.suraId));
    runBusyFuture(_getQuranRecitersList());
    _playerListener();
  }

  Future<void> getUseSettings() async => await _userSettingsService
      .getUserSettings()
      .then((value) => _userSettings = value!);

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
    if (_userSettings.quranReciterId == -1) {
      await _userSettingsService
          .setQuranReciter(quranReciters.first.id)
          .then((value) => _userSettings = value);
      notifyListeners();
    }
  }

  void _scrollToAyah(int ayahId) {
    Scrollable.ensureVisible(GlobalObjectKey(ayahId).currentContext!,
        duration: const Duration(milliseconds: 300),
        alignment: 0.5,
        curve: Curves.easeInOutCubic);
  }

  void _playerListener() async {
    _player.onPositionChanged.listen((duration) {
      if (_suraPlayerModel == null) return;
      final ayahItem = _suraPlayerModel!.pages
          .lastWhere((e) => e.startTime <= duration.inMilliseconds);
      if (ayahItem.ayah != _playingAyahId) {
        _playingAyahId = ayahItem.ayah;
        notifyListeners();
        _scrollToAyah(playingAyahId);
      }
    });

    _player.onPlayerStateChanged.listen((state) {
      _currentPlayerState = state;
      notifyListeners();
    });
  }

  void playSura(AyahModel ayahModel) async {
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
        _playSuraWithSpesificPosition(ayahModel);
      }, (e) async => debugPrint(e.message));
    }, (e) async => debugPrint(e.message));
  }

  void _playSuraWithSpesificPosition(AyahModel ayahModel) async {
    if (_suraPlayerModel case final SuraPlayer suraPlayerModel) {
      final ayah =
          suraPlayerModel.pages.singleWhere((e) => e.ayah == ayahModel.ayet);
      await _player.play(UrlSource(suraPlayerModel.audio));
      await _player.seek(Duration(milliseconds: ayah.startTime));
      _scrollToAyah(ayahModel.ayet);
      // State'i değiştir
      _playingAyahId = ayahModel.ayet;
      notifyListeners();
    }
  }

  void pauseAudioPlayer() async {
    if (_player.state == PlayerState.playing) {
      await _player.pause();
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
        onSelectedReciter: (reciter) {
          _userSettingsService
              .setQuranReciter(reciter.id)
              .then((value) => _userSettings = value);
        },
        onSuraSettingChanged: (suraSetting) {
          _userSettingsService
              .setSuraSettings(suraSetting)
              .then((value) => _userSettings = value);
          notifyListeners();
        },
      ),
    );
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
