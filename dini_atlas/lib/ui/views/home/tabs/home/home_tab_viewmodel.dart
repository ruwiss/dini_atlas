import 'package:dini_atlas/app/app.dialogs.dart';
import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/app/app.router.dart';
import 'package:dini_atlas/extensions/datetime_extensions.dart';
import 'package:dini_atlas/extensions/string_extensions.dart';
import 'package:dini_atlas/models/location_api/city.dart';
import 'package:dini_atlas/models/prayer/eid_prayer.dart';
import 'package:dini_atlas/models/prayer/prayer_time.dart';
import 'package:dini_atlas/models/user_setting.dart';
import 'package:dini_atlas/services/local/location_service.dart';
import 'package:dini_atlas/services/local/prayer_times_service.dart';
import 'package:dini_atlas/services/local/user_settings_service.dart';
import 'package:dini_atlas/services/notification/prayer_notification.dart';
import 'package:dini_atlas/services/remote/fetch_times_service.dart';
import 'package:dini_atlas/ui/dialogs/settings/settings_noti_dialog.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:dini_atlas/ui/views/home/home_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeTabViewModel extends ReactiveViewModel {
  final HomeService homeService;
  HomeTabViewModel({required this.homeService});
  final _prayerTimesService = locator<PrayerTimesService>();
  final _fetchTimesService = locator<FetchTimesService>();
  final _userSettingsService = locator<UserSettingsService>();
  final _locationService = locator<LocationService>();
  final _navigationService = locator<NavigationService>();

  String? currentMoonPhaseImage;
  City? userCity;
  int? selectedPrayerTime;
  bool locationBusy = false;

  List<PrayerTime>? get _prayerTimeList => homeService.prayerTimes?.prayerTimes;
  EidPrayerTime? get _eidPrayerTime => homeService.prayerTimes?.eidPrayers;
  bool? get nextTimeIsAfterDay => homeService.nextTimeIsAfterDay;
  PrayerType get currentPrayerType => homeService.currentPrayerType;
  List<PrayerNotiSettings>? prayerNotiSettingsList;

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
    getUserCity();

    // Tablo için vakitleri getir
    changePrayerTimeIndex();

    FlutterNativeSplash.remove();
  }

  Future<void> _getPrayerTimes() async {
    final result = await _prayerTimesService.getPrayerTimes();

    await result.fold(
      (times) async {
        homeService.prayerTimes = times;
        notifyListeners();
        // Namaz vakitlerini bildirim ekranı için Shared Preferences'a kaydet
        await PrayerTimesService.savePrayerTimesToSharedPreferences(times);
        PrayerNotification.showPrayerCountdownNotification();
      },
      (ifNotUpToDate) async {
        // Asenkron işlem tamamlanana kadar bekleyeceğiz
        homeService.prayerTimes = await _fetchTimesService.fetchTimes();
        notifyListeners();
      },
    );

    notifyListeners();
  }

  void _getCurrentMoonPhaseImage() {
    currentMoonPhaseImage =
        homeService.getTimesByDay(DateTime.now()).ayinSekliUrl.split("/").last;
    notifyListeners();
  }

  void getUserCity() async {
    final userSettings = await _userSettingsService.getUserSettings();
    userCity = userSettings?.city;
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
      // Tabloda önceki güne gidilince
      if (increment != null) selectedPrayerTime = selectedPrayerTime! + 1;
      // Tabloda sonraki güne gidilirse
      if (decrement != null) selectedPrayerTime = selectedPrayerTime! - 1;

      // Eğer tabloda gidilen gün mevcut listede yoksa başa dön
      if (selectedPrayerTime! >= _prayerTimeList!.length) {
        selectedPrayerTime = 0;
      } else if (selectedPrayerTime!.isNegative) {
        // Eğer tabloda gidilen günden daha öncesi yoksa sona git
        selectedPrayerTime = _prayerTimeList!.length - 1;
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
          // Tek bir vakit bildirim ayarını güncelle
          await _userSettingsService.setPrayerNotiSettings(
              prayerNotiSettings: settings);
          getAllPrayerNotiSettings();
        },
        onSaveAll: (settings) async {
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
}
