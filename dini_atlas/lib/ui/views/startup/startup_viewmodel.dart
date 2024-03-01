import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dini_atlas/app/app.bottomsheets.dart';
import 'package:dini_atlas/app/app.router.dart';
import 'package:dini_atlas/models/user_location.dart';
import 'package:dini_atlas/services/local/app_widget_service.dart';
import 'package:dini_atlas/services/local/location_service.dart';
import 'package:dini_atlas/services/local/network_checker.dart';
import 'package:dini_atlas/services/local/prayer_times_service.dart';
import 'package:dini_atlas/services/local/user_settings_service.dart';
import 'package:dini_atlas/services/notification/push_notification.dart';
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
  final _bottomSheetService = locator<BottomSheetService>();
  final _prayerTimesService = locator<PrayerTimesService>();

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
      final fetchResult = await _fetchTimesService.fetchTimes();
      fetchResult.fold((l) {}, (r) {
        setError(r.message);
        _manuelFetchLocationCountry(l);
      });
    }, (r) {
      setError(r);
      _bottomSheetService.showBottomSheet(
        title: "Konum Problemi",
        description: "Konumunuzu almaya çalışırken bir problem oluştu.",
        confirmButtonTitle: "Tamam",
      );
    });
  }

  late UserLocation _manuelSelectUserLocation;

  // Konum ve vakitlerle ilgili sorun oluşursa kullanıcı konumunu kendisi seçsin
  void _manuelFetchLocationCountry(UserLocation location) async {
    _manuelSelectUserLocation = location;
    final countries = await _fetchTimesService.getCountries();
    final country = await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.location,
        barrierDismissible: false,
        title: "Ülke Seçiniz",
        data: countries.map((e) => e.ulkeAdiEn).toList());
    if (country == null) return;
    final selection =
        countries.firstWhere((e) => e.ulkeAdiEn == (country.data as String));
    _manuelSelectUserLocation.country = selection.ulkeAdiEn;

    _manuelFetchLocationCity(selection.ulkeId);
  }

  void _manuelFetchLocationCity(String countryId) async {
    final cities = await _fetchTimesService.getCities(countryId);
    final city = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.location,
      barrierDismissible: false,
      title: "Şehir Seçiniz",
      data: cities.map((e) => e.sehirAdiEn).toList(),
    );
    if (city == null) return;
    final selection = cities.firstWhere((e) => e.sehirAdiEn == city.data);
    _manuelSelectUserLocation.city = selection.sehirAdiEn;

    _manuelFetchLocationState(selection.sehirId);
  }

  void _manuelFetchLocationState(String sehirId) async {
    final states = await _fetchTimesService.getStates(sehirId);
    final state = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.location,
      barrierDismissible: false,
      title: "İlçe Seçiniz",
      data: states.map((e) => e.ilceAdiEn).toList(),
    );
    if (state == null) return;
    final selection = states.firstWhere((e) => e.ilceAdiEn == state.data);
    _manuelSelectUserLocation.state = selection.ilceAdiEn;

    await _userSettingsService.setUserLocationSettings(
        location: _manuelSelectUserLocation);
    final fetchResult = await _fetchTimesService.fetchTimes();
    fetchResult.fold((l) {
      _navigationService.replaceWithHomeView();
    }, (r) {});
  }

  // Eğer veritabanına daha önce vakitler kayıt edildiyse, ana sayfaya git
  void checkLocation() async {
    final hasPrayerTimes = await _prayerTimesService.hasPrayerTimes();
    if (hasPrayerTimes) {
      _navigationService.replaceWithHomeView();
    } else {
      FlutterNativeSplash.remove();
    }
    await PushNotification.instance.setupNotification();
    AppWidgetService.init();
  }

  @override
  void dispose() {
    _networkChecker.dispose();
    super.dispose();
  }
}
