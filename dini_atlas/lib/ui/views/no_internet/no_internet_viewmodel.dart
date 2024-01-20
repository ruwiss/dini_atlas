import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/services/local/network_checker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NoInternetViewModel extends ReactiveViewModel {
  final _networkChecker = locator<NetworkChecker>();
  final _navigationService = locator<NavigationService>();

  ConnectivityResult get _status => _networkChecker.currentConnectivity;

  void _checkConnectivity() {
    if (_status != ConnectivityResult.none) {
      _navigationService.replaceWith(_navigationService.previousRoute);
    }
  }

  @override
  void notifyListeners() {
    _checkConnectivity();
    super.notifyListeners();
  }

  @override
  void dispose() {
    _networkChecker.dispose();
    super.dispose();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_networkChecker];
}
