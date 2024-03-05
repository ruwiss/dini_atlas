import 'dart:async';
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
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
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

  PlayerState _currentPlayerState = PlayerState.stopped;
  PlayerState get currentPlayerState => _currentPlayerState;

  bool? isZoomInfoShown;

  void init(SuraInfo sura) async {
    await runBusyFuture(_getUserSettings());
    await runBusyFuture(_getQuranRecitersList());
    await runBusyFuture(_getSuraUrlList(sura));
    _playerListener();
  }

  Future<void> _getUserSettings() async {
    _userSettings = await _userSettingsService.getUserSettings();
  }

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

  int _suraErrCount = 0;

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
      }, (er) async {
        debugPrint(er.message);
        _suraErrCount++;
        if (_suraErrCount < 3) {
          _getSuraUrlList;
        } else {
          _navigationService.back();
          _bottomSheetService.showBottomSheet(
            title: "Sorun oldu 🙁",
            description:
                "Sunucuyla ilgili bir sorun oluştu. Biraz bekleyip tekrar deneyin.",
            confirmButtonTitle: "Seç",
          );
        }
      });
    }, (err) async {
      debugPrint(err.message);
      await _bottomSheetService.showBottomSheet(
        title: "Sorun oldu 🙁",
        description:
            "Seçili okuyucunun verilerine şuanda ulaşılamıyor. Başka bir okuyucu seçer misiniz?",
        confirmButtonTitle: "Seç",
      );
      _navigationService.back();
      onSettingsTap();
    });
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

      final one = _suraPlayerModel?.pages[0];
      final two = _suraPlayerModel?.pages[1];
      final first = one?.page != null ? one : two;

      if (_currentAyah?.ayah == first?.ayah) {
        // İlk okunan ayet, zoom bilgisi göster
        if (!_userSettingsService.isZoomInfoShown) {
          isZoomInfoShown = false;
          notifyListeners();
          Future.delayed(const Duration(milliseconds: 3500), () {
            _userSettingsService.isZoomInfoShown = true;
            isZoomInfoShown = true;
            notifyListeners();
          });
        }
      }
    });
    // Oynatıcı durumunu dinle (durdu / başladı gibi)
    _player.onPlayerStateChanged.listen((state) {
      // Durum değişince state'i güncelle
      _currentPlayerState = state;
      notifyListeners();

      if (state == PlayerState.playing && showPlayerView) {
        showAndHidePlayerViewWithDuration();
      }
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

  Uint8List? _svgFile;
  String? _svgUrl;
  Future<Uint8List> getUint8ListFromUrl(String url) async {
    if (_svgUrl == url) return _svgFile!;
    final response = await Dio()
        .get(url, options: Options(responseType: ResponseType.bytes));
    if (response.statusCode == 200) {
      final List<int> bytes = response.data;
      _svgUrl = url;
      _svgFile = Uint8List.fromList(bytes);
      return _svgFile!;
    } else {
      throw Exception('Failed to load SVG');
    }
  }

  bool _showPlayerView = true;
  bool get showPlayerView => _showPlayerView;

  void togglePlayerView(bool val) {
    _showPlayerView = val;
    notifyListeners();
  }

  void showAndHidePlayerViewWithDuration() {
    togglePlayerView(true);
    Timer.periodic(const Duration(seconds: 3), (timer) {
      timer.cancel();
      togglePlayerView(false);
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
