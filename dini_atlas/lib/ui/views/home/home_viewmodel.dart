import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends IndexTrackingViewModel {
  List<String> get tabItems => [
        kiHome,
        kiCategories,
        kiQuran,
      ];

  bool get showSettingsIcon => [0, 2].contains(currentIndex);

  void onSettingsTap() {
    // index'e göre diyalog açılacak
  }
}
