import 'package:dini_atlas/app/app.router.dart';
import 'package:dini_atlas/services/local/location_service.dart';
import 'package:dini_atlas/services/local/user_settings_service.dart';
import 'package:dini_atlas/services/remote/fetch_times_service.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:stacked/stacked.dart';
import 'package:dini_atlas/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _locationService = locator<LocationService>();
  final _userSettingsService = locator<UserSettingsService>();
  final _fetchTimesService = locator<FetchTimesService>();

  // Eğer veritabanına daha önce location kayıt edilmediyse, lokasyon bilgilerini al
  void getDatas() async {
    await runBusyFuture(_fetchUserLocationAndPrayerTimes());
    _navigationService.replaceWithHomeView();
  }

  Future<void> _fetchUserLocationAndPrayerTimes() async {
    final result = await _locationService.getUserLocation();
    result.fold((l) async {
      await _userSettingsService.setUserSettings(location: l);
      await _fetchTimesService.fetchTimes();
    }, (r) {
      setError(r);
      rebuildUi();
    });
  }

  // Eğer veritabanına daha önce location kayıt edildiyse, ana sayfaya git
  void checkLocation() async {
    final location =
        await runBusyFuture(_userSettingsService.getUserSettings());

    if (location == null) {
      FlutterNativeSplash.remove();
    } else {
      _navigationService.replaceWithHomeView();
    }
  }
}
