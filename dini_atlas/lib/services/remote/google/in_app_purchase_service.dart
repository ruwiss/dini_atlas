import 'package:dini_atlas/ui/common/constants/app_strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:stacked/stacked.dart';

class InAppPurchaseService with ListenableServiceMixin {
  List<EntitlementInfo> _entitlements = [];
  List<EntitlementInfo> get entitlements => _entitlements;

  List<Offering> _offers = [];
  List<Offering> get offers => _offers;

  CustomerInfo? _customerInfo;
  CustomerInfo? get customerInfo => _customerInfo;
  bool get hasSubscription =>
      customerInfo?.activeSubscriptions.isNotEmpty ?? false;

  void listen() => listenToReactiveValues(
      [entitlements, offers, customerInfo, hasSubscription]);

  Future<void> init() async {
    if (kDebugMode) await Purchases.setLogLevel(LogLevel.debug);
    await Purchases.configure(PurchasesConfiguration(ksIapKey));
    await _getCustomerInfo();
    // Eğer abonelik varsa reklamları kapat
    if (hasSubscription) ksShowAdmobAds = false;
  }

  Future<void> _getCustomerInfo() async {
    try {
      _customerInfo = await Purchases.getCustomerInfo();
      updatePurchaseStatus(_customerInfo!);
    } on PlatformException catch (_) {
      // Error fetching customer info
    }
  }

  Future<void> updatePurchaseStatus(CustomerInfo customerInfo) async {
    _customerInfo = customerInfo;
    _entitlements = customerInfo.entitlements.active.values.toList();
    notifyListeners();
  }

  Future<void> fetchOffers() async {
    try {
      final offerings = await Purchases.getOfferings();
      final current = offerings.current;
      _offers = current == null ? [] : [current];
      notifyListeners();
    } on PlatformException catch (_) {
      return;
    }
  }

  Future<bool> purchasePackage(Package package) async {
    try {
      final customer = await Purchases.purchasePackage(package);
      updatePurchaseStatus(customer);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> restoreTransactions() async {
    try {
      final customer = await Purchases.restorePurchases();
      updatePurchaseStatus(customer);
      return hasSubscription;
    } catch (e) {
      return false;
    }
  }
}
