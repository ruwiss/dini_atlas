import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NetworkChecker with ListenableServiceMixin {
  // Çağrılırken tanımlanabilecekler
  bool autoNavigate = true;

  final _navigationService = locator<NavigationService>();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> subscription;
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
    subscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      currentConnectivity = result;
      _notify();
    });
  }

  void _notify() {
    notifyListeners();
    if (currentConnectivity == ConnectivityResult.none && autoNavigate) {
      if (_navigationService.currentRoute != Routes.noInternetView) {
        _navigationService.replaceWithNoInternetView();
      }
    }
  }

  void dispose() => subscription.cancel();
}
