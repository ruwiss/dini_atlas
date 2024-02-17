import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/models/user_location.dart';
import 'package:dini_atlas/services/local/user_settings_service.dart';
import 'package:dini_atlas/services/remote/google/admob_service.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:stacked/stacked.dart';
import 'dart:math' as math;
import 'dart:async';

enum CompassType { compass, map }

class CompassViewModel extends BaseViewModel {
  final _userSettingsService = locator<UserSettingsService>();

  final _bannerAd = AdmobBannerAdService(adUnitId: ksAdmobBanner5);
  BannerAd? get bannerAd => _bannerAd.bannerAd;
  void _loadBannerAd() => _bannerAd.loadAd(onAdLoaded: () => notifyListeners());

  bool? _locationPermission;
  bool get locationPermission => _locationPermission!;

  bool? _deviceSupport;
  bool get deviceSupport => _deviceSupport!;

  UserLocation? _userLocation;
  UserLocation? get userLocation => _userLocation;
  double get userLatitude => _userLocation!.latitude;
  double get userLongtitude => _userLocation!.longtitude;

  CompassType _compassType = CompassType.compass;
  CompassType get compassType => _compassType;

  void setCompassType(CompassType type) {
    _compassType = type;
    notifyListeners();
  }

  void init() async {
    await runBusyFuture(_checkDeviceSupport());
    await runBusyFuture(checkLocationPermission());
    getUserSettings();
    _listenForSensors();
  }

  Future<void> getUserSettings() async {
    final settings = await _userSettingsService.getUserSettings();
    _userLocation = UserLocation.fromIsarJson(settings!.jsonString);
    notifyListeners();
  }

  Future<void> _checkDeviceSupport() async {
    _deviceSupport = await FlutterQiblah.androidDeviceSensorSupport() ?? false;
    if (deviceSupport) _loadBannerAd();
  }

  Future<void> checkLocationPermission() async {
    await FlutterQiblah.requestPermissions();
    _locationPermission = (await FlutterQiblah.checkLocationStatus()).enabled;
    notifyListeners();
  }

  late final StreamSubscription<MagnetometerEvent> _subscription1;

  int magneticPercentage = 0;

  void _listenForSensors() async {
    _subscription1 = magnetometerEventStream().listen((event) {
      final x = event.x;
      final y = event.y;
      final z = event.z;
      magneticPercentage = math.sqrt((x * x) + (y * y) + (z * z)).toInt();
    });
  }

  @override
  void dispose() {
    _subscription1.cancel();
    super.dispose();
  }
}
