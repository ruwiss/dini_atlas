import 'package:dini_atlas/services/local/network_checker.dart';
import 'package:dini_atlas/ui/views/home/home_view.dart';
import 'package:dini_atlas/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:dini_atlas/services/local/location_service.dart';
import 'package:dini_atlas/ui/bottom_sheets/alert/alert_sheet.dart';
import 'package:dini_atlas/ui/dialogs/settings/settings_dialog.dart';
import 'package:dini_atlas/services/local/isar_service.dart';
import 'package:dini_atlas/services/local/user_settings_service.dart';
import 'package:dini_atlas/services/remote/dio_service.dart';
import 'package:dini_atlas/services/remote/fetch_times_service.dart';
import 'package:dini_atlas/services/local/prayer_times_service.dart';
import 'package:dini_atlas/ui/views/no_internet/no_internet_view.dart';
import 'package:dini_atlas/services/remote/quran_service.dart';
import 'package:dini_atlas/ui/views/quran/quran_view.dart';
import 'package:dini_atlas/services/local/favorites_service.dart';
import 'package:dini_atlas/ui/views/favourites/favourites_view.dart';
import 'package:dini_atlas/ui/views/traceable_quran/traceable_quran_view.dart';
import 'package:dini_atlas/ui/views/compass/compass_view.dart';
import 'package:dini_atlas/ui/views/kaza/kaza_view.dart';
import 'package:dini_atlas/services/remote/auth_service.dart';
import 'package:dini_atlas/services/remote/kaza_service.dart';
import 'package:dini_atlas/ui/views/rosary/rosary_view.dart';
import 'package:dini_atlas/ui/views/religious_days/religious_days_view.dart';
import 'package:dini_atlas/ui/views/forty_hadiths/forty_hadiths_view.dart';
import 'package:dini_atlas/ui/views/radio/radio_view.dart';
import 'package:dini_atlas/ui/views/near_mosques/near_mosques_view.dart';
import 'package:dini_atlas/ui/views/riyazus_salihin/riyazus_salihin_view.dart';
import 'package:dini_atlas/ui/views/esmaul_husna/esmaul_husna_view.dart';
import 'package:dini_atlas/ui/views/dualar/dualar_view.dart';
import 'package:dini_atlas/ui/views/elifba/elifba_view.dart';
import 'package:dini_atlas/ui/bottom_sheets/location/location_sheet.dart';
import 'package:dini_atlas/ui/views/about/about_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: NoInternetView),
    CustomRoute(
      page: QuranView,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    ),
    MaterialRoute(page: FavouritesView),
    MaterialRoute(page: TraceableQuranView),
    MaterialRoute(page: CompassView),
    MaterialRoute(page: KazaView),
    MaterialRoute(page: RosaryView),
    MaterialRoute(page: ReligiousDaysView),
    MaterialRoute(page: FortyHadithsView),
    MaterialRoute(page: RadioView),
    MaterialRoute(page: NearMosquesView),
    MaterialRoute(page: RiyazusSalihinView),
    MaterialRoute(page: EsmaulHusnaView),
    MaterialRoute(page: DualarView),
    MaterialRoute(page: ElifbaView),
    CustomRoute(
      page: AboutView,
      transitionsBuilder: TransitionsBuilders.slideRightWithFade,
    ),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: NavigationService),
    Factory(classType: NetworkChecker),
    LazySingleton(classType: LocationService),
    InitializableSingleton(classType: IsarService),
    LazySingleton(classType: UserSettingsService),
    LazySingleton(classType: PrayerTimesService),
    LazySingleton(classType: DioService),
    LazySingleton(classType: FetchTimesService),
    LazySingleton(classType: QuranService),
    LazySingleton(classType: FavouritesService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: KazaService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: AlertSheet),
    StackedBottomsheet(classType: LocationSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: SettingsDialog),
// @stacked-dialog
  ],
)
class App {}
