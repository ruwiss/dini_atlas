import 'package:dini_atlas/app/app.locator.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:dini_atlas/services/local/isar_service.dart';
import 'package:dini_atlas/services/local/user_settings_service.dart';
import 'package:dini_atlas/services/remote/dio_service.dart';
import 'package:dini_atlas/services/remote/fetch_times_service.dart';
import 'package:dini_atlas/services/local/prayer_times_service.dart';
import 'package:dini_atlas/services/remote/quran_service.dart';
import 'package:dini_atlas/services/local/favorites_service.dart';
import 'package:dini_atlas/services/remote/auth_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<IsarService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<UserSettingsService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DioService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<FetchTimesService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<PrayerTimesService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<QuranService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<FavouritesService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<AuthService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterIsarService();
  getAndRegisterUserSettingsService();
  getAndRegisterDioService();
  getAndRegisterFetchTimesService();
  getAndRegisterPrayerTimesService();
  getAndRegisterQuranService();
  getAndRegisterFavoritesService();
  getAndRegisterAuthService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockIsarService getAndRegisterIsarService() {
  _removeRegistrationIfExists<IsarService>();
  final service = MockIsarService();
  locator.registerSingleton<IsarService>(service);
  return service;
}

MockUserSettingsService getAndRegisterUserSettingsService() {
  _removeRegistrationIfExists<UserSettingsService>();
  final service = MockUserSettingsService();
  locator.registerSingleton<UserSettingsService>(service);
  return service;
}

MockDioService getAndRegisterDioService() {
  _removeRegistrationIfExists<DioService>();
  final service = MockDioService();
  locator.registerSingleton<DioService>(service);
  return service;
}

MockFetchTimesService getAndRegisterFetchTimesService() {
  _removeRegistrationIfExists<FetchTimesService>();
  final service = MockFetchTimesService();
  locator.registerSingleton<FetchTimesService>(service);
  return service;
}

MockPrayerTimesService getAndRegisterPrayerTimesService() {
  _removeRegistrationIfExists<PrayerTimesService>();
  final service = MockPrayerTimesService();
  locator.registerSingleton<PrayerTimesService>(service);
  return service;
}

MockQuranService getAndRegisterQuranService() {
  _removeRegistrationIfExists<QuranService>();
  final service = MockQuranService();
  locator.registerSingleton<QuranService>(service);
  return service;
}

MockFavouritesService getAndRegisterFavoritesService() {
  _removeRegistrationIfExists<FavouritesService>();
  final service = MockFavouritesService();
  locator.registerSingleton<FavouritesService>(service);
  return service;
}

MockAuthService getAndRegisterAuthService() {
  _removeRegistrationIfExists<AuthService>();
  final service = MockAuthService();
  locator.registerSingleton<AuthService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
