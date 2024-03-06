import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/services/local/network_checker.dart';
import 'package:dini_atlas/services/remote/google/admob_service.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:stacked/stacked.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewViewModel extends BaseViewModel {
  late final WebViewController controller;
  NetworkChecker? _networkChecker;

  final _bannerAd = AdmobBannerAdService(adUnitId: ksAdmobBanner2);
  BannerAd? get bannerAd => _bannerAd.bannerAd;
  void _loadBannerAd() => _bannerAd.loadAd(onAdLoaded: () => notifyListeners());

  void init({String? url, String? path, required bool showAd}) {
    runBusyFuture(_loadWebView(url: url, path: path));
    if (showAd) _loadBannerAd();
  }

  Future<void> _loadWebView({String? url, String? path}) async {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(kcBackgroundColor)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            if (progress == 100) {
              setBusy(false);
            } else if (!isBusy) {
              setBusy(true);
            }
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      );

    if (path case final String path) {
      await controller.loadFlutterAsset(path);
    } else if (url case final String url) {
      _networkChecker = locator<NetworkChecker>();
      await controller.loadRequest(Uri.parse(url));
    }
  }

  @override
  void dispose() {
    _networkChecker?.dispose();
    super.dispose();
  }
}
