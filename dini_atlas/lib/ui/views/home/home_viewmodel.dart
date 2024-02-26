import 'package:dini_atlas/app/app.dialogs.dart';
import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/app/app.router.dart';
import 'package:dini_atlas/services/local/app_widget_service.dart';
import 'package:dini_atlas/services/local/user_settings_service.dart';
import 'package:dini_atlas/services/notification/push_notification.dart';
import 'package:dini_atlas/services/remote/google/firebase_remote_config_service.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/dialogs/settings/settings_dialog.dart';
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
    AppWidgetService.init(); // Home Widgets
    await PushNotification.instance.setupNotification();
    await _optimizationPermissions();
    _checkAvailableUpdate();
  }

  Future<void> _optimizationPermissions() async {
    final batteryPerm = await Permission.ignoreBatteryOptimizations.isGranted;
    final exactAlarmPerm = await Permission.scheduleExactAlarm.isGranted;
    if (!batteryPerm || !exactAlarmPerm) {
      final result = await _bottomSheetService.showBottomSheet(
        title: "Küçük bir ayar gerekli",
        description:
            "Vakitlerin düzgün çalışması pil optimizasyonu ayarı gereklidir. Gelecek olan izin isteğini kabul ediniz.",
        confirmButtonTitle: "Yönlendir",
      );
      if (result != null && result.confirmed) {
        await Permission.ignoreBatteryOptimizations.request();
        await Permission.scheduleExactAlarm.request();
      }
    }
  }

  void _checkAvailableUpdate() async {
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
      data: SettingsBaseDialogItem(
        checkboxValue: userSettings!.silentModeEnable,
        title: "Sessiz Mod",
        svgIcon: kiEar,
        subtitle: "Namaz vaktinden 5 dk önce başlar ve 30 dk sonra biter",
        onChanged: (value) async {
          await _userSettingsService.setSilentMode(value);
          _homeService.getUserSettings();
          final permission =
              await PermissionHandler.permissionsGranted ?? false;
          if (!permission) await PermissionHandler.openDoNotDisturbSetting();
        },
        showDivider: false,
      ),
    );
  }
}
