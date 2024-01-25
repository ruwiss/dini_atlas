import 'package:dini_atlas/app/app.dialogs.dart';
import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../dialogs/settings/settings_base_dialog.dart';

class HomeViewModel extends IndexTrackingViewModel {
  final dialogService = locator<DialogService>();
  List<String> get tabItems => [
        kiHome,
        kiCategories,
        kiQuran,
      ];

  bool get showSettingsIcon => [0, 2].contains(currentIndex);

  void onSettingsTap() {
    if (currentIndex == 0) {
      _showHomeSettingsDialog();
    }
  }

  void _showHomeSettingsDialog() {
    dialogService.showCustomDialog(
      variant: DialogType.settings,
      data: [
        SettingsBaseDialog(
          title: "Sessiz Mod",
          svgIcon: kiEar,
          subtitle: "Namaz vaktinden 5 dk önce başlar ve 30 dk sonra biter",
          onChanged: (value) {},
          showDivider: false,
        ),
      ],
    );
  }
}
