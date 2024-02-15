import 'dart:typed_data';
import 'package:audioplayers/audioplayers.dart';
import 'package:dini_atlas/app/app.dialogs.dart';
import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/models/quran/quran_reciter.dart';
import 'package:dini_atlas/models/quran/sura_info.dart';
import 'package:dini_atlas/models/quran/sura_player.dart';
import 'package:dini_atlas/models/user_setting.dart';
import 'package:dini_atlas/services/local/user_settings_service.dart';
import 'package:dini_atlas/services/remote/quran_service.dart';
import 'package:dini_atlas/ui/dialogs/settings/settings_traceable_quran_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TraceableQuranViewModel extends BaseViewModel {
  final _player = AudioPlayer();
  final _dialogService = locator<DialogService>();
  final _userSettingsService = locator<UserSettingsService>();
  final _quranService = locator<QuranService>();

  UserSettings? _userSettings;
  UserSettings get userSettings => _userSettings!;

  List<QuranReciter>? _quranReciters;
  List<QuranReciter> get quranReciters => _quranReciters!;
  QuranReciter quranReciterById(int id) =>
      quranReciters.singleWhere((e) => e.id == id);

  SuraPlayer? _suraPlayerModel;
  SuraPlayer get suraPlayerModel => _suraPlayerModel!;

  SuraPage? _currentAyah;
  SuraPage? get currentAyah => _currentAyah;

  PlayerState _currentPlayerState = PlayerState.playing;
  PlayerState get currentPlayerState => _currentPlayerState;

  late SuraInfo _suraInfo;

  void init(SuraInfo sura) async {
    _suraInfo = sura;
    await runBusyFuture(_getUserSettings());
    await runBusyFuture(_getQuranRecitersList());
    await runBusyFuture(_getSuraUrlList(sura));
    _playerListener();
  }

  Future<void> _getUserSettings() async => await _userSettingsService
      .getUserSettings()
      .then((value) => _userSettings = value!);

  Future<void> _getQuranRecitersList() async {
    // Kuran okuyucu listesini getir
    final result = await _quranService.getQuranReciters();
    result.fold((data) {
      // Veriyi kaydet
      _quranReciters = data;
      notifyListeners();
    }, (error) {
      debugPrint(error.message);
      setError(error.message);
    });
    if (userSettings.quranReciterId == -1) {
      await _userSettingsService
          .setQuranReciter(quranReciters.first.id)
          .then((value) => _userSettings = value);
      notifyListeners();
    }
  }

  Future<void> _getSuraUrlList(SuraInfo sura) async {
    final currentReciterId = userSettings.quranReciterId;
    final result =
        await _quranService.getSuraAudio(quranReciterById(currentReciterId));

    await result.fold((suraAudios) async {
      // Mevcut sure adresini getir
      final currentAudio =
          suraAudios.items.singleWhere((e) => e.suraId == sura.suraId);
      // Sureye ait ses dosyasını ve takip sırasını getir
      final playerResult = await _quranService.getSuraPlayer(currentAudio.url);

      await playerResult.fold((l) async {
        _suraPlayerModel = l;
        _currentAyah = l.pages.first;
        await playAudio();
      }, (er) async => debugPrint(er.message));
    }, (err) async => debugPrint(err.message));
  }

  Future<void> playAudio() async {
    if (_player.state == PlayerState.paused) {
      await _player.resume();
    } else {
      await _player.play(UrlSource(suraPlayerModel.audio));
    }
  }

  Future<void> pauseAudio() async {
    await _player.pause();
  }

  Future<void> seekAudio(int position) async {
    await _player.seek(Duration(milliseconds: position));
  }

  String? findPageNumberFromAyah(String? page) {
    return page?.split("/").last.split(".").first;
  }

  // Sonraki sayfayı tespit et ve oynat
  Future<void> forwardAudio() async {
    // Mevcut sayfayı tespit et
    final strThisPageNumber = findPageNumberFromAyah(currentAyah?.page);
    if (strThisPageNumber == null) return;

    final int? thisPageNumber = int.tryParse(strThisPageNumber);
    if (thisPageNumber == null) return;

    // Sonraki sayfayı tespit et
    try {
      final SuraPage nextPage = suraPlayerModel.pages.firstWhere((e) {
        final strNextPageNumber = findPageNumberFromAyah(e.page);
        if (strNextPageNumber == null) return false;

        final int? nextPageNumber = int.tryParse(strNextPageNumber);
        if (nextPageNumber == null) return false;

        return nextPageNumber > thisPageNumber;
      });
      debugPrint("Sayfa değişimi: ${nextPage.page}");
      _currentAyah = nextPage;
      await runBusyFuture(seekAudio(nextPage.startTime));
      notifyListeners();
    } catch (e) {
      debugPrint("Sonraki sayfa yok: $e");
    }
  }

  // Önceki sayfayı tespit et ve oynat
  Future<void> previousAudio() async {
    // Mevcut sayfayı tespit et
    final strThisPageNumber = findPageNumberFromAyah(currentAyah?.page);
    if (strThisPageNumber == null) return;
    final int? thisPageNumber = int.tryParse(strThisPageNumber);
    if (thisPageNumber == null) return;

    // Önceki sayfayı tespit et
    try {
      final SuraPage prevPage = suraPlayerModel.pages.lastWhere((e) {
        final strPrevPageNumber = findPageNumberFromAyah(e.page);
        if (strPrevPageNumber == null) return false;

        final int? prevPageNumber = int.tryParse(strPrevPageNumber);
        if (prevPageNumber == null) return false;
        return prevPageNumber < thisPageNumber;
      });
      debugPrint("Sayfa değişimi: ${prevPage.page}");
      final pageItems =
          suraPlayerModel.pages.where((e) => e.page == prevPage.page).toList();
      pageItems.sort((a, b) => a.ayah.compareTo(b.ayah));
      _currentAyah = pageItems.first;
      await runBusyFuture(seekAudio(currentAyah!.startTime));
      notifyListeners();
    } catch (e) {
      debugPrint("Önceki sayfa yok: $e");
    }
  }

  void _playerListener() async {
    // Player süresi değişikliklerini dinle
    _player.onPositionChanged.listen((duration) {
      if (_suraPlayerModel == null) return;
      // Oynatılan sesin ayetini bul
      final ayahItem = _suraPlayerModel!.pages
          .lastWhere((e) => e.startTime <= duration.inMilliseconds);
      // Farklı bir ayet okunuyorsa state'i güncelle
      if (ayahItem.ayah != currentAyah!.ayah) {
        // State'i sıradaki ayete güncelle
        _currentAyah = ayahItem;
        notifyListeners();
      }

      // Son okunan ayeti cihaza kaydet
      if (_userSettings?.lastReadAyah.ayah != ayahItem.ayah) {
        _userSettingsService
            .setLastReadAyah(LastReadAyah()
              ..ayah = ayahItem.ayah
              ..sura = _suraInfo.name)
            .then((value) => _userSettings = value);
      }
    });
    // Oynatıcı durumunu dinle (durdu / başladı gibi)
    _player.onPlayerStateChanged.listen((state) {
      // Durum değişince state'i güncelle
      _currentPlayerState = state;
      notifyListeners();
    });
  }

  void onSettingsTap() {
    _dialogService.showCustomDialog(
      variant: DialogType.settings,
      title: "Ayarlar",
      data: SettingsTraceableQuranDialog(
        quranReciters: quranReciters,
        currentReciterId: userSettings.quranReciterId,
        onSelectedReciter: (reciter) {
          _userSettingsService.setQuranReciter(reciter.id).then((value) {
            _userSettings = value;
            notifyListeners();
          });
        },
      ),
    );
  }

  Future<Uint8List> getUint8ListFromUrl(String url) async {
    final response = await Dio()
        .get(url, options: Options(responseType: ResponseType.bytes));
    if (response.statusCode == 200) {
      final List<int> bytes = response.data;
      return Uint8List.fromList(bytes);
    } else {
      throw Exception('Failed to load SVG');
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
