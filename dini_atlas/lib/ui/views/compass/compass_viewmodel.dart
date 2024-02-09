import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:stacked/stacked.dart';
import 'dart:math' as math;
import 'dart:async';

class CompassViewModel extends BaseViewModel {
  bool? _locationPermission;
  bool get locationPermission => _locationPermission!;

  bool? _deviceSupport;
  bool get deviceSupport => _deviceSupport!;

  // UserLocation? _userLocation;

  void init() async {
    await runBusyFuture(_checkDeviceSupport());
    await runBusyFuture(checkLocationPermission());
    _listenForSensors();
  }

  Future<void> checkLocationPermission() async {
    _locationPermission = (await FlutterQiblah.checkLocationStatus()).enabled;
    notifyListeners();
  }

  Future<void> _checkDeviceSupport() async {
    _deviceSupport = await FlutterQiblah.androidDeviceSensorSupport() ?? false;
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
