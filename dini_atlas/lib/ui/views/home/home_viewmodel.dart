import 'package:dini_atlas/app/app.dialogs.dart';
import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/services/local/user_settings_service.dart';
import 'package:dini_atlas/services/notification/push_notification.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/dialogs/settings/settings_dialog.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'home_service.dart';

class HomeViewModel extends IndexTrackingViewModel {
  late final HomeService _homeService;
  final _userSettingsService = locator<UserSettingsService>();
  final _dialogService = locator<DialogService>();
  List<String> get tabItems => [kiHome, kiCategories, kiQuran];

  bool get showSettingsIcon => currentIndex == 0; // ana sayfa ayarlar butonu

  void init(HomeService homeService) async {
    PushNotification.instance.setupNotification();
    _homeService = homeService;
  }

  void onSettingsTap() {
    // Home ekranı ayarlar diyaloğu
    _showHomeSettingsDialog();
  }

  bool get silentModeEnabled =>
      _homeService.userSettings?.silentModeEnable ?? false;

  void _showHomeSettingsDialog() {
    final userSettings = _homeService.userSettings;
    _dialogService.showCustomDialog(
      variant: DialogType.settings,
      data: SettingsBaseDialogItem(
        checkboxValue: userSettings!.silentModeEnable,
        title: "Sessiz Mod",
        svgIcon: kiEar,
        subtitle: "Namaz vaktinden 5 dk önce başlar ve 30 dk sonra biter",
        onChanged: (value) async {
          await _userSettingsService.setSilentMode(value);
          _homeService.getUserSettings();
        },
        showDivider: false,
      ),
    );
  }
}
