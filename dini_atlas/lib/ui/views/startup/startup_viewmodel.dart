import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dini_atlas/app/app.bottomsheets.dart';
import 'package:dini_atlas/app/app.router.dart';
import 'package:dini_atlas/extensions/string_extensions.dart';
import 'package:dini_atlas/models/user_location.dart';
import 'package:dini_atlas/services/local/location_service.dart';
import 'package:dini_atlas/services/local/network_checker.dart';
import 'package:dini_atlas/services/local/prayer_times_service.dart';
import 'package:dini_atlas/services/local/user_settings_service.dart';
import 'package:dini_atlas/services/remote/fetch_times_service.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
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
  final _bottomSheetService = locator<BottomSheetService>();
  final _prayerTimesService = locator<PrayerTimesService>();

  // Eğer veritabanına daha önce location kayıt edilmediyse, lokasyon bilgilerini al
  void getDatas() async {
    if (_networkChecker.currentConnectivity == ConnectivityResult.none) {
      _navigationService.replaceWithNoInternetView();
    } else {
      await runBusyFuture(_fetchUserLocationAndPrayerTimes());
    }
  }

  Future<void> _fetchUserLocationAndPrayerTimes() async {
    final result = await _locationService.getUserLocation();
    await result.fold((l) async {
      await _userSettingsService.setUserLocationSettings(location: l);
      final fetchResult = await _fetchTimesService.fetchTimes();
      fetchResult.fold((l) => _navigateToHomeView(true), (r) {
        manuelFetchLocationCountry(location: l);
      });
    }, (r) async => setError(r));
  }

  late UserLocation _manuelSelectUserLocation;

  // Konum ve vakitlerle ilgili sorun oluşursa kullanıcı konumunu kendisi seçsin
  void manuelFetchLocationCountry({UserLocation? location}) async {
    setBusy(true);
    if (location == null) {
      final result = await _locationService.getUserLocation();
      await result.fold((l) async {
        location ??= l;
      }, (r) async => setError(r));
    }
    setBusy(false);
    if (hasError) return;
    _manuelSelectUserLocation = location!;
    final countries = await _fetchTimesService.getCountries();
    final country = await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.location,
        barrierDismissible: false,
        title: "Ülke Seçiniz",
        data: countries.map((e) => e.ulkeAdiEn.capitalize()).toList());
    if (country == null) return;
    final selection = countries.firstWhere(
        (e) => e.ulkeAdiEn == (country.data as String).toLowerCase());
    _manuelSelectUserLocation.country = selection.ulkeAdiEn;

    _manuelFetchLocationCity(selection.ulkeId);
  }

  void _manuelFetchLocationCity(String countryId) async {
    final cities = await _fetchTimesService.getCities(countryId);
    final city = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.location,
      barrierDismissible: false,
      title: "Şehir Seçiniz",
      data: cities.map((e) => e.sehirAdiEn.capitalize()).toList(),
    );
    if (city == null) return;
    final selection = cities
        .firstWhere((e) => e.sehirAdiEn == (city.data as String).toLowerCase());
    _manuelSelectUserLocation.city = selection.sehirAdiEn;

    _manuelFetchLocationState(selection.sehirId);
  }

  void _manuelFetchLocationState(String sehirId) async {
    final states = await _fetchTimesService.getStates(sehirId);
    final state = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.location,
      barrierDismissible: false,
      title: "İlçe Seçiniz",
      data: states.map((e) => e.ilceAdiEn.capitalize()).toList(),
    );
    if (state == null) return;
    final selection = states
        .firstWhere((e) => e.ilceAdiEn == (state.data as String).toLowerCase());
    _manuelSelectUserLocation.state = selection.ilceAdiEn;

    setBusy(true);
    await _userSettingsService.setUserLocationSettings(
        location: _manuelSelectUserLocation);
    final fetchResult = await _fetchTimesService.fetchTimes();
    setBusy(false);
    fetchResult.fold((l) => _navigateToHomeView(false), (r) {});
  }

  void _navigateToHomeView(bool autoLocation) {
    _navigationService.replaceWithHomeView();
    FirebaseAnalytics.instance.logEvent(
        name: "location_success", parameters: {"autoLocation": autoLocation});
  }

  // Eğer veritabanına daha önce vakitler kayıt edildiyse, ana sayfaya git
  void checkLocation() async {
    final hasPrayerTimes = await _prayerTimesService.hasPrayerTimes();
    if (hasPrayerTimes) {
      _navigationService.replaceWithHomeView();
    } else {
      FlutterNativeSplash.remove();
    }
  }

  @override
  void dispose() {
    _networkChecker.dispose();
    super.dispose();
  }
}
