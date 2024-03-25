import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/services/remote/google/in_app_purchase_service.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AboutViewModel extends IndexTrackingViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();
  final _iapService = locator<InAppPurchaseService>();

  bool _showSubscriptionView = false;
  bool get showSubscriptionView => _showSubscriptionView;

  void init({bool showSubscriptionView = false}) {
    _showSubscriptionView = showSubscriptionView;
  }

  List<EntitlementInfo> get entitlements => _iapService.entitlements;
  List<Offering> get offers => _iapService.offers;
  List<Package> get packages => offers
      .map((offer) => offer.availablePackages)
      .expand((pair) => pair)
      .toList();

  bool isPurchased(SubscriptionItem item) =>
      customerInfo?.activeSubscriptions.any((e) => e == item.identifier) ??
      false;

  CustomerInfo? get customerInfo => _iapService.customerInfo;
  bool get hasSubscription => _iapService.hasSubscription;

  void onRemoveAdsButtonTap() {
    _showSubscriptionView = true;
    notifyListeners();
    runBusyFuture(_iapService.fetchOffers());
    FirebaseAnalytics.instance.logScreenView(screenName: 'subscription');
  }

  void onBackButtonTap() {
    if (_showSubscriptionView) {
      _showSubscriptionView = false;
      notifyListeners();
    } else {
      _navigationService.back();
    }
  }

  String? _selectedPackageId;
  String? get selectedPrice => _selectedPackageId;

  void onSelectPrice(String id) {
    _selectedPackageId = id;
    notifyListeners();
  }

  void onSelectSubscription() async {
    final package =
        packages.singleWhere((e) => e.identifier == _selectedPackageId);
    final item = SubscriptionItem.fromPackage(package);
    if (await _iapService.purchasePackage(package)) {
      _bottomSheetService.showBottomSheet(
        title: "Başarılı",
        description: "'${item.name}' başarıyla uygulandı",
        confirmButtonTitle: "Kapat",
      );
    }
  }

  void onSelectRestore() async {
    final result = await runBusyFuture(_iapService.restoreTransactions());
    _bottomSheetService.showBottomSheet(
      title: result ? "Başarılı" : "Üzgünüm",
      description: result
          ? "Mevcut aboneliğiniz geri geldi"
          : "Aktif aboneliğiniz bulunamadı",
      confirmButtonTitle: "Kapat",
    );
  }
}

class SubscriptionItem {
  final String id;
  final String identifier;
  final String name;
  final String price;

  SubscriptionItem(this.id, this.identifier, this.name, this.price);

  static SubscriptionItem fromPackage(Package package) {
    final product = package.toJson()['product'];
    return SubscriptionItem(
        package.identifier,
        product['identifier'],
        product['description'].toString().toUpperCase(),
        product['priceString']);
  }
}
