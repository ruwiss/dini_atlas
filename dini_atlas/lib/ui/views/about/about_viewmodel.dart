import 'package:dini_atlas/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AboutViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  bool _showSubscriptionView = false;
  bool get showSubscriptionView => _showSubscriptionView;

  void onRemoveAdsButtonTap() {
    _showSubscriptionView = true;
    notifyListeners();
  }

  void onBackButtonTap() {
    if (_showSubscriptionView) {
      _showSubscriptionView = false;
      notifyListeners();
    } else {
      _navigationService.back();
    }
  }

  String? _selectedPrice;
  String? get selectedPrice => _selectedPrice;

  void onSelectPrice(String id) {
    _selectedPrice = id;
    notifyListeners();
  }
}
