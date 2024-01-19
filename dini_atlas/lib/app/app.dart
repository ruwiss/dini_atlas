import 'package:dini_atlas/ui/views/home/home_view.dart';
import 'package:dini_atlas/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:dini_atlas/services/local/location_service.dart';
import 'package:dini_atlas/ui/bottom_sheets/alert/alert_sheet.dart';
import 'package:dini_atlas/ui/dialogs/settings/settings_dialog.dart';
import 'package:dini_atlas/services/local/isar_service.dart';
import 'package:dini_atlas/services/local/user_settings_service.dart';
import 'package:dini_atlas/services/remote/dio_service.dart';
import 'package:dini_atlas/services/remote/fetch_times_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: LocationService),
    InitializableSingleton(classType: IsarService),
    LazySingleton(classType: UserSettingsService),
    LazySingleton(classType: DioService),
    LazySingleton(classType: FetchTimesService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: AlertSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: SettingsDialog),
// @stacked-dialog
  ],
)
class App {}
