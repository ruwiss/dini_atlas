import 'dart:developer';
import 'package:dini_atlas/app/app.dialogs.dart';
import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/app/app.router.dart';
import 'package:dini_atlas/models/user_setting.dart';
import 'package:dini_atlas/services/local/app_widget_service.dart';
import 'package:dini_atlas/services/local/user_settings_service.dart';
import 'package:dini_atlas/services/notification/app_notifications.dart';
import 'package:dini_atlas/services/remote/google/admob_service.dart';
import 'package:dini_atlas/services/remote/google/firebase_remote_config_service.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/dialogs/settings/settings_home_dialog.dart';
import 'package:dini_atlas/ui/dialogs/settings/settings_noti_dialog.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sound_mode/permission_handler.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'home_service.dart';

class HomeViewModel extends IndexTrackingViewModel {
  late final HomeService _homeService;
  final _userSettingsService = locator<UserSettingsService>();
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();
  List<String> get tabItems => [kiHome, kiCategories, kiQuran];

  bool get isHomePage => currentIndex == 0;

  List<PrayerNotiSettings>? prayerNotiSettingsList;

  void init(HomeService homeService) async {
    _homeService = homeService;
    AppWidgetService.init();
    await AppNotifications.instance.setupNotification();
    await _optimizationPermissions();
    // Kullanıcı vakit ayarlarını liste olarak getir
    await getAllPrayerNotiSettings();
    _checkAvailableUpdate();
  }

  Future<void> _optimizationPermissions() async {
    try {
      final batteryPerm = await Permission.ignoreBatteryOptimizations.isGranted;
      final systemAlertWindow = await Permission.systemAlertWindow.isGranted;
      if (!batteryPerm || !systemAlertWindow) {
        final result = await _bottomSheetService.showBottomSheet(
          title: "Küçük bir ayar gerekli",
          description:
              "Vakitlerin düzgün çalışması pil optimizasyonu ayarı gereklidir. Gelecek olan izin isteğini kabul ediniz.",
          confirmButtonTitle: "Yönlendir",
        );
        if (result != null && result.confirmed) {
          await Permission.ignoreBatteryOptimizations.request();
          await Permission.systemAlertWindow.request();
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _checkAvailableUpdate() async {
    try {
      final info = await InAppUpdate.checkForUpdate();
      if (info.updateAvailability != UpdateAvailability.updateAvailable) return;
      if (info.availableVersionCode case final int version) {
        final int immediateVersion =
            FirebaseRemoteConfigServiceClass.i.immediateUpdateVersion;
        if (version >= immediateVersion) {
          await InAppUpdate.performImmediateUpdate();
        } else {
          final result = await InAppUpdate.startFlexibleUpdate();
          if (result == AppUpdateResult.success) {
            await InAppUpdate.completeFlexibleUpdate();
          }
        }
      }
    } on PlatformException catch (e) {
      log("Play Store'a erişilemediği için InAppUpdate: ${e.code}");
    }
  }

  void onSettingsTap() {
    // Home ekranı ayarlar diyaloğu
    _showHomeSettingsDialog();
  }

  void onAboutTap() {
    // Hakkımda sayfası
    _navigationService.navigateToAboutView();
    FirebaseAnalytics.instance.logScreenView(screenName: 'about');
  }

  bool get silentModeEnabled =>
      _homeService.userSettings?.silentModeEnable ?? false;

  void _showHomeSettingsDialog() {
    final userSettings = _homeService.userSettings;
    _dialogService.showCustomDialog(
      variant: DialogType.settings,
      barrierDismissible: true,
      data: HomeSettingsDialog(
        silentEnabled: userSettings!.silentModeEnable,
        onChangedSilentMode: (v) async {
          await _userSettingsService.setSilentMode(v);
          _homeService.getUserSettings();
          final permission =
              await PermissionHandler.permissionsGranted ?? false;
          if (!permission) {
            try {
              await PermissionHandler.openDoNotDisturbSetting();
            } catch (e) {
              debugPrint(e.toString());
            }
          }
        },
        alarmModeEnabled: userSettings.alarmMode,
        onChangedAlarmMode: (v) async {
          await _userSettingsService.setAlarmMode(v);
          _homeService.getUserSettings();
          await AppNotifications.instance.setAlarmMode(v);
        },
        hideAyet: userSettings.hideAyetDailyContent ?? false,
        onChangedHideAyet: (v) async {
          await _userSettingsService
              .setUserSettings(userSettings..hideAyetDailyContent = v);
          _homeService.getUserSettings();
        },
        hideHadis: userSettings.hideHadisDailyContent ?? false,
        onChangedHideHadis: (v) async {
          await _userSettingsService
              .setUserSettings(userSettings..hideHadisDailyContent = v);
          _homeService.getUserSettings();
        },
        hideDua: userSettings.hideDuaDailyContent ?? false,
        onChangedHideDua: (v) async {
          await _userSettingsService
              .setUserSettings(userSettings..hideDuaDailyContent = v);
          _homeService.getUserSettings();
        },
        hideBabyNames: userSettings.hideErkekIsmiDailyContent ?? false,
        onChangedHideBabyNames: (v) async {
          await _userSettingsService.setUserSettings(userSettings
            ..hideErkekIsmiDailyContent = v
            ..hideKizIsmiDailyContent = v);
          _homeService.getUserSettings();
        },
        hideSoruCevap: userSettings.hideSoruCevapDailyContent ?? false,
        onChangedHideSoruCevap: (v) async {
          await _userSettingsService
              .setUserSettings(userSettings..hideSoruCevapDailyContent = v);
          _homeService.getUserSettings();
        },
      ),
    );
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

  final notificationsOverlayController = OverlayPortalController();

  void onTapNotificationsMenu() {
    notificationsOverlayController.toggle();
  }

  // Vakit ayarlar diyaloğunu göster
  void showNotificationSettingsDialog(PrayerType type) {
    final settings = getPrayerNotiSettings(type);
    final dialogService = locator<DialogService>();

    // Diyaloğu göster
    dialogService.showCustomDialog(
      variant: DialogType.settings,
      title: type.text,
      barrierDismissible: true,
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
}
