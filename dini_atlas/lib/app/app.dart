import 'package:dini_atlas/services/local/network_checker.dart';
import 'package:dini_atlas/ui/views/home/home_view.dart';
import 'package:dini_atlas/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:dini_atlas/services/local/location_service.dart';
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
import 'package:dini_atlas/ui/bottom_sheets/location/location_sheet.dart';
import 'package:dini_atlas/ui/views/about/about_view.dart';
import 'package:dini_atlas/services/remote/google/in_app_purchase_service.dart';
import 'package:dini_atlas/ui/views/native_widget/native_widget_view.dart';
import 'package:dini_atlas/ui/dialogs/remove_ads/remove_ads_dialog.dart';
import 'package:dini_atlas/ui/views/webview/webview_view.dart';
import 'package:dini_atlas/ui/bottom_sheets/image/image_sheet.dart';
import 'package:dini_atlas/ui/views/story/story_view.dart';
import 'package:dini_atlas/services/remote/story_service.dart';
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
    CustomRoute(
      page: AboutView,
      transitionsBuilder: TransitionsBuilders.slideRightWithFade,
    ),
    MaterialRoute(page: NativeWidgetView),
    MaterialRoute(page: WebviewView),
    CustomRoute(
      page: StoriesView,
      transitionsBuilder: TransitionsBuilders.slideBottom,
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
    LazySingleton(classType: InAppPurchaseService),
    LazySingleton(classType: StoryService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: LocationSheet),
    StackedBottomsheet(classType: ImageSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: SettingsDialog),
    StackedDialog(classType: RemoveAdsDialog),
// @stacked-dialog
  ],
)
class App {}
