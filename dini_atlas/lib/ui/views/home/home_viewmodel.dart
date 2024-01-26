import 'package:dini_atlas/app/app.dialogs.dart';
import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/services/local/user_settings_service.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/dialogs/settings/settings_dialog.dart';
import 'package:dini_atlas/ui/dialogs/settings/settings_quran_dialog.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'home_service.dart';

class HomeViewModel extends IndexTrackingViewModel {
  late final HomeService _homeService;
  final _userSettingsService = locator<UserSettingsService>();
  final _dialogService = locator<DialogService>();
  List<String> get tabItems => [kiHome, kiCategories, kiQuran];

  bool get showSettingsIcon => [0, 2].contains(currentIndex);

  void init(HomeService homeService) async {
    _homeService = homeService;
  }

  void onSettingsTap() {
    if (currentIndex == 0) {
      // Home ekranı ayarlar diyaloğu
      _showHomeSettingsDialog();
    } else if (currentIndex == 2) {
      // Kuran ekranı ayarlar diyaloğu
      _showQuranSettingsDialog();
    }
  }

  bool get silentModeEnabled =>
      _homeService.userSettings?.silentModeEnable ?? false;

  void _showHomeSettingsDialog() {
    final userSettings = _homeService.userSettings;
    _dialogService.showCustomDialog(
      variant: DialogType.settings,
      data: SettingsBaseDialog(
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

  void _showQuranSettingsDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.settings,
      data: SettingsQuranDialog(
        quranReciterId: 0,
        onRecitedIdChanged: (id) async {
          await _userSettingsService.setQuranReciter(id);
          _homeService.getUserSettings();
        },
      ),
    );
  }
}
