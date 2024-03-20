import 'dart:typed_data';

import 'package:dini_atlas/app/app.dialogs.dart';
import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/app/app.router.dart';
import 'package:dini_atlas/extensions/datetime_extensions.dart';
import 'package:dini_atlas/extensions/string_extensions.dart';
import 'package:dini_atlas/models/daily_content.dart';
import 'package:dini_atlas/models/location_api/state.dart';
import 'package:dini_atlas/models/prayer/eid_prayer.dart';
import 'package:dini_atlas/models/prayer/prayer_time.dart';
import 'package:dini_atlas/models/story_model.dart';
import 'package:dini_atlas/models/user_setting.dart';
import 'package:dini_atlas/services/local/app_widget_service.dart';
import 'package:dini_atlas/services/local/location_service.dart';
import 'package:dini_atlas/services/local/prayer_times_service.dart';
import 'package:dini_atlas/services/local/user_settings_service.dart';
import 'package:dini_atlas/services/notification/prayer_notification.dart';
import 'package:dini_atlas/services/remote/fetch_times_service.dart';
import 'package:dini_atlas/services/remote/google/admob_service.dart';
import 'package:dini_atlas/services/remote/daily_service.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/dialogs/settings/settings_noti_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:dini_atlas/ui/views/home/home_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

enum TableTab { normal, detailed }

class HomeTabViewModel extends ReactiveViewModel {
  final HomeService homeService;
  HomeTabViewModel({required this.homeService});
  final _prayerTimesService = locator<PrayerTimesService>();
  final _fetchTimesService = locator<FetchTimesService>();
  final _userSettingsService = locator<UserSettingsService>();
  final _locationService = locator<LocationService>();
  final _navigationService = locator<NavigationService>();
  final _storyService = locator<DailyService>();

  final _interstitialAdService =
      AdmobInterstitialAdService(adUnitId: ksAdmobInterstitial2);

  bool _interstitialAdLoadProcess = false;

  void _loadInterstitalAdAndShow() {
    if (!_interstitialAdLoadProcess) {
      _interstitialAdLoadProcess = true;
      _interstitialAdService.loadAd(
        onAdLoaded: () => _interstitialAdService.interstitialAd?.show(),
      );
    }
  }

  String? currentMoonPhaseImage;
  Uint8List? currentMoonImage;
  StateModel? userStateLocation;
  int? selectedPrayerTime;
  bool locationBusy = false;

  List<PrayerTime>? get _prayerTimeList => homeService.prayerTimes?.prayerTimes;
  EidPrayerTime? get _eidPrayerTime => homeService.prayerTimes?.eidPrayers;
  bool? get nextTimeIsAfterDay => homeService.nextTimeIsAfterDay;
  PrayerType get currentPrayerType => homeService.currentPrayerType;
  List<PrayerNotiSettings>? prayerNotiSettingsList;

  StoriesModel? _storiesModel;
  StoriesModel? get storiesModel => _storiesModel;

  DailyContents? _dailyContents;
  DailyContents? get dailContents => _dailyContents;

  TableTab _currentTableTab = TableTab.normal;
  TableTab get currentTableTab => _currentTableTab;

  PageController pageController = PageController();

  void changeTableTab(int index) {
    _currentTableTab = TableTab.values[index];
    notifyListeners();

    if (_currentTableTab == TableTab.detailed) {
      // Günlük verileri getir
      _getDaily();
    }
    _userSettingsService.setHomeTab(index);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [homeService];

  Future<void> init() async {
    // Ana servisteki değişiklikleri dinle
    homeService.listen();

    // Kullanıcı vakit ayarlarını liste olarak getir
    await getAllPrayerNotiSettings();

    // Namaz vakitlerini getir
    await _getPrayerTimes();

    // Uygulama ayarlarını getir (diyalog)
    homeService.getUserSettings();

    // Gelen namaz vakitlerini hazırla
    homeService.calculatePrayerTime();

    // Ayın seklini getir
    _getCurrentMoonPhaseImage();

    // Kullanıcı şehrini getir
    getUserStateLocation();

    // Tablo için vakitleri getir
    changePrayerTimeIndex();

    // En son seçilen Tab'ı seç
    _getAndSetDefaultHomeTab();

    FlutterNativeSplash.remove();
  }

  void _getAndSetDefaultHomeTab() async {
    final defaultTabIndex = await _userSettingsService.getHomeTabIndex();
    if (defaultTabIndex == 1) {
      pageController.animateToPage(defaultTabIndex,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      //changeTableTab(defaultTabIndex);
    }
  }

  Future<void> _getPrayerTimes() async {
    final result = await _prayerTimesService.getPrayerTimes();

    await result.fold(
      (times) async {
        homeService.prayerTimes = times
          ..prayerTimes.sort(
            (a, b) =>
                a.miladiTarihUzunIso8601.compareTo(b.miladiTarihUzunIso8601),
          );
        notifyListeners();
        // Namaz vakitlerini bildirim ekranı için Shared Preferences'a kaydet
        await PrayerTimesService.savePrayerTimesToSharedPreferences(times);
        PrayerNotification.showPrayerCountdownNotification();
        AppWidgetService.updateHomeWidgetsIfAvailable();
      },
      (ifNotUpToDate) async {
        // Asenkron işlem tamamlanana kadar bekleyeceğiz
        final fetchResult = await _fetchTimesService.fetchTimes();
        fetchResult.fold((l) => homeService.prayerTimes = l, (r) => null);
        notifyListeners();
      },
    );

    notifyListeners();
  }

  void _getCurrentMoonPhaseImage() async {
    try {
      currentMoonPhaseImage = homeService
          .getTimesByDay(DateTime.now())
          .ayinSekliUrl
          .split("/")
          .last;
      final result = await Dio().get(
        "$ksBaseUrl/aygoruntusu/$currentMoonPhaseImage",
        options: Options(
          responseType: ResponseType.bytes,
          headers: {"token": ksToken},
        ),
      );
      currentMoonImage = result.data;
      notifyListeners();
    } catch (e) {
      debugPrint("Ay resmi getirilemedi: $e");
    }
  }

  void getUserStateLocation() async {
    final userSettings = await _userSettingsService.getUserSettings();
    userStateLocation = userSettings?.state;
    notifyListeners();
  }

  PrayerTime get tablePrayerTime => _prayerTimeList![selectedPrayerTime!];

  void changePrayerTimeIndex({bool? increment, bool? decrement}) {
    // Eğer bir değişim yoksa, o zaman sadece bugünün namazı sırasını getir
    if (increment == null && decrement == null) {
      final DateTime datetime = DateTime.now();

      // Sıradaki vakit namazları getir (tablo için)
      selectedPrayerTime = _prayerTimeList
          ?.indexWhere((e) => e.miladiTarihUzunIso8601.isEqualTo(datetime));
    } else {
      if (increment != null) {
        // Eğer sonraki gün yoksa işlem yapma
        if ((selectedPrayerTime! + 1) >= _prayerTimeList!.length) return;

        // Sonraki elemanı seç
        selectedPrayerTime = selectedPrayerTime! + 1;
      } else if (decrement != null) {
        // Eğer önceki gün yoksa işlem yapma
        if ((selectedPrayerTime! - 1).isNegative) return;

        // Önceki elemanı seç
        selectedPrayerTime = selectedPrayerTime! - 1;
      }
    }
    notifyListeners();
  }

  bool isCurrentPrayerTime(PrayerTime prayerTime) =>
      prayerTime.miladiTarihUzunIso8601.isEqualTo(DateTime.now());

  void updateLocation() async {
    setBusyForObject(locationBusy, true);
    final result = await _locationService.getUserLocation();
    await result.fold((l) async {
      await _fetchTimesService.fetchTimes(userLocation: l);
      _prayerTimesService.prayerTimes = null;
      _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
    }, (r) {});
    setBusyForObject(locationBusy, false);
  }

  // Tüm vakitler için bildirim ayarlarını getir
  Future<void> getAllPrayerNotiSettings() async {
    prayerNotiSettingsList =
        await _userSettingsService.getAllPrayerNotiSettings();
    notifyListeners();

    // İlk girişte ve ayarlar kaydedildiğinde, bildirim ayarlarını
    // Background Task üzerinde kontrol etmek için Shared Preferences'a kaydet
    _userSettingsService
        .setPrayerNotiSettingsForBackgroundTask(prayerNotiSettingsList!);
  }

  // Daha önce getirilen vakit bildirim ayarlarından 1 tanesini filtreleyip geri döndür
  PrayerNotiSettings getPrayerNotiSettings(PrayerType prayerType) {
    final notiSettings =
        prayerNotiSettingsList!.singleWhere((e) => e.name == prayerType.text);
    return notiSettings.copyWith();
  }

  // Vakit bildirim seçeneği aktif mi kontrol et
  bool isNotiActiveForPrayer(PrayerType prayerType) {
    return getPrayerNotiSettings(prayerType).voiceWarningEnable;
  }

  // Vakit ayarlar diyaloğunu göster
  void showNotificationSettingsDialog(PrayerType type) {
    final settings = getPrayerNotiSettings(type);
    final dialogService = locator<DialogService>();

    // Diyaloğu göster
    dialogService.showCustomDialog(
      variant: DialogType.settings,
      title: type.text,
      data: SettingsNotiDialog(
        prayerNotiSettings: settings.copyWith(),
        onSave: (settings) async {
          _loadInterstitalAdAndShow();
          // Tek bir vakit bildirim ayarını güncelle
          await _userSettingsService.setPrayerNotiSettings(
              prayerNotiSettings: settings);
          getAllPrayerNotiSettings();
        },
        onSaveAll: (settings) async {
          _loadInterstitalAdAndShow();
          // Tüm vakitlerin bildirim ayarlarını güncelle
          await _userSettingsService.setPrayerNotiSettings(
            prayerNotiSettings: settings,
            updateAll: true,
          );
          getAllPrayerNotiSettings();
        },
      ),
    );
  }

  String? ifTodayEidPrayerTimeGetTime() {
    final kurban = _eidPrayerTime?.bayramNamazVakti.kurbanBayramNamaziTarihi;
    final ramazan = _eidPrayerTime?.bayramNamazVakti.ramazanBayramNamaziTarihi;
    if (kurban == null || ramazan == null) return null;

    final now = DateTime.now();
    final kurbanDateTime = kurban.convertStringTimeToDateTime();
    final ramazanDateTime = ramazan.convertStringTimeToDateTime();

    if (now.isEqualTo(kurbanDateTime)) {
      final time = _eidPrayerTime?.bayramNamazVakti.kurbanBayramNamaziSaati
          .parseTimeAsString();
      return "Kurban Bayramı Namazı: $time";
    } else if (now.isEqualTo(ramazanDateTime)) {
      final time = _eidPrayerTime?.bayramNamazVakti.ramazanBayramNamaziSaati
          .parseTimeAsString();
      return "Ramazan Bayramı Namazı: $time";
    } else {
      return null;
    }
  }

  List<PrayerTime> get weeklyPrayerTimes => [
        _prayerTimeList![selectedPrayerTime!], // 1. Gün
        _prayerTimeList![selectedPrayerTime! + 1], // 2. Gün
        _prayerTimeList![selectedPrayerTime! + 2], // 3. Gün
        _prayerTimeList![selectedPrayerTime! + 3], // 4. Gün
        _prayerTimeList![selectedPrayerTime! + 4], // 5. Gün
        _prayerTimeList![selectedPrayerTime! + 5], // 6. Gün
        _prayerTimeList![selectedPrayerTime! + 6], // 7. Gün
      ];

  void _getDaily() async {
    if (_storiesModel == null || _dailyContents == null) {
      await _storyService.getDaily();
      _storiesModel = _storyService.storiesModel;
      _dailyContents = _storyService.dailyContentsModel;
      notifyListeners();
      getStoryViews();
    }
  }

  void getStoryViews() async {
    if (_storiesModel case final StoriesModel model) {
      for (final category in model.categories) {
        final items = model.stories.singleWhere((e) => e.type == category.id);
        int percentage = items.stories.length;
        for (var story in items.stories) {
          if (await _storyService.isStorySeen(story.media)) percentage--;
        }
        category.seenPercentage = percentage / items.stories.length;
      }
      notifyListeners();
    }
  }
}
