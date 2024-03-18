// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../services/local/favorites_service.dart';
import '../services/local/isar_service.dart';
import '../services/local/location_service.dart';
import '../services/local/network_checker.dart';
import '../services/local/prayer_times_service.dart';
import '../services/local/user_settings_service.dart';
import '../services/remote/daily_service.dart';
import '../services/remote/dio_service.dart';
import '../services/remote/fetch_times_service.dart';
import '../services/remote/google/in_app_purchase_service.dart';
import '../services/remote/kaza_service.dart';
import '../services/remote/quran_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerFactory(() => NetworkChecker());
  locator.registerLazySingleton(() => LocationService());
  final isarService = IsarService();
  await isarService.init();
  locator.registerSingleton(isarService);

  locator.registerLazySingleton(() => UserSettingsService());
  locator.registerLazySingleton(() => PrayerTimesService());
  locator.registerLazySingleton(() => DioService());
  locator.registerLazySingleton(() => FetchTimesService());
  locator.registerLazySingleton(() => QuranService());
  locator.registerLazySingleton(() => FavouritesService());
  locator.registerLazySingleton(() => KazaService());
  locator.registerLazySingleton(() => InAppPurchaseService());
  locator.registerLazySingleton(() => DailyService());
}
