import 'package:dini_atlas/app/app.router.dart';
import 'package:dini_atlas/services/local/location_service.dart';
import 'package:dini_atlas/services/local/user_settings_service.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:stacked/stacked.dart';
import 'package:dini_atlas/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _locationService = locator<LocationService>();
  final _userSettingsService = locator<UserSettingsService>();

  // Eğer veritabanına daha önce location kayıt edilmediyse, lokasyon bilgilerini al
  void getLocation() async {
    final result = await runBusyFuture(_locationService.getUserLocation());
    if (result != null) {
      await runBusyFuture(_userSettingsService.setUserLocation(result));
      _navigationService.replaceWithHomeView();
    }
  }

  // Eğer veritabanına daha önce location kayıt edildiyse, ana sayfaya git
  void checkLocation() async {
    final location =
        await runBusyFuture(_userSettingsService.getUserLocation());
    if (location == null) {
      FlutterNativeSplash.remove();
    } else {
      _navigationService.replaceWithHomeView();
    }
  }
}
