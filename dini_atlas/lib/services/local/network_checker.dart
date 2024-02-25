import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/app/app.router.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'dart:async';

class NetworkChecker with ListenableServiceMixin {
  // Çağrılırken tanımlanabilecekler
  bool autoNavigate = true;

  final _navigationService = locator<NavigationService>();

  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _subscription;
  StreamSubscription<ConnectivityResult> get subscription => _subscription!;
  ConnectivityResult currentConnectivity = ConnectivityResult.other;

  NetworkChecker() {
    listenToReactiveValues([currentConnectivity]);
    _init();
  }

  void _init() async {
    // ilk kontrol
    currentConnectivity = await _connectivity.checkConnectivity();
    _notify();

    // sürekli kontrol
    _subscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      currentConnectivity = result;
      _notify();
    });
  }

  void _notify() {
    notifyListeners();
    if (currentConnectivity == ConnectivityResult.none && autoNavigate) {
      if (_navigationService.currentRoute != Routes.noInternetView) {
        if (kDebugMode) print("İnternet Yok");
        _navigationService.replaceWithNoInternetView();
      }
    }
  }

  void dispose() => _subscription?.cancel();
}
