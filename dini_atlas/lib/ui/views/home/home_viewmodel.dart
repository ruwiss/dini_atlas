import 'dart:developer';
import 'package:dini_atlas/app/app.dialogs.dart';
import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/app/app.router.dart';
import 'package:dini_atlas/services/local/app_widget_service.dart';
import 'package:dini_atlas/services/local/user_settings_service.dart';
import 'package:dini_atlas/services/notification/app_notifications.dart';
import 'package:dini_atlas/services/remote/google/firebase_remote_config_service.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/dialogs/settings/settings_home_dialog.dart';
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

  bool get showSettingsIcon => currentIndex == 0; // ana sayfa ayarlar butonu

  void init(HomeService homeService) async {
    _homeService = homeService;
    AppWidgetService.init();
    await AppNotifications.instance.setupNotification();
    await _optimizationPermissions();
    _checkAvailableUpdate();
  }

  Future<void> _optimizationPermissions() async {
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
            await PermissionHandler.openDoNotDisturbSetting();
          }
        },
        alarmModeEnabled: userSettings.alarmMode,
        onChangedAlarmMode: (v) async {
          await _userSettingsService.setAlarmMode(v);
          _homeService.getUserSettings();
          await AppNotifications.instance.setAlarmMode(v);
        },
      ),
    );
  }
}
