import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dini_atlas/app/app.router.dart';
import 'package:dini_atlas/services/local/location_service.dart';
import 'package:dini_atlas/services/local/network_checker.dart';
import 'package:dini_atlas/services/local/user_settings_service.dart';
import 'package:dini_atlas/services/remote/fetch_times_service.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:stacked/stacked.dart';
import 'package:dini_atlas/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _networkChecker = locator<NetworkChecker>()..autoNavigate = false;
  final _navigationService = locator<NavigationService>();
  final _locationService = locator<LocationService>();
  final _userSettingsService = locator<UserSettingsService>();
  final _fetchTimesService = locator<FetchTimesService>();

  // Eğer veritabanına daha önce location kayıt edilmediyse, lokasyon bilgilerini al
  void getDatas() async {
    if (_networkChecker.currentConnectivity == ConnectivityResult.none) {
      _navigationService.replaceWithNoInternetView();
    } else {
      await runBusyFuture(_fetchUserLocationAndPrayerTimes());
      if (modelError == null) _navigationService.replaceWithHomeView();
    }
  }

  Future<void> _fetchUserLocationAndPrayerTimes() async {
    final result = await _locationService.getUserLocation();
    await result.fold((l) async {
      await _userSettingsService.setUserLocationSettings(location: l);
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

  @override
  void dispose() {
    _networkChecker.dispose();
    super.dispose();
  }
}
