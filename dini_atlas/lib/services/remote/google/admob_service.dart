import 'package:dini_atlas/app/app.dialogs.dart';
import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/ui/common/constants/app_strings.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';

// 10 Kere Videolu reklam görürse reklamları kaldır diyaloğunu göster
void checkCountAndShowRemoveAdsDialog() async {
  final prefs = await SharedPreferences.getInstance();
  if ((prefs.getInt('adCounter') ?? 0) >= 10) {
    await locator<DialogService>().showCustomDialog(
      variant: DialogType.removeAds,
      barrierDismissible: true,
    );
    prefs.remove('adCounter');
  }
}

class AdmobBannerAdService {
  final String adUnitId;
  AdmobBannerAdService({required this.adUnitId});
  BannerAd? _bannerAd;
  BannerAd? get bannerAd => _bannerAd;

  final String _testAdUnitId = "ca-app-pub-3940256099942544/6300978111";

  /// Loads a banner ad.
  void loadAd({VoidCallback? onAdLoaded}) {
    if (!ksShowAdmobAds) return;
    _bannerAd = BannerAd(
      adUnitId: ksTestAds ? _testAdUnitId : adUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (!ksShowAdmobAds) return;
          debugPrint('$ad loaded.');
          onAdLoaded?.call();
        },
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');
          ad.dispose();
        },
      ),
    )..load();
  }
}

class AdmobInterstitialAdService {
  final String adUnitId;
  AdmobInterstitialAdService({required this.adUnitId});

  InterstitialAd? _interstitialAd;
  InterstitialAd? get interstitialAd => _interstitialAd;

  final String _testAdUnitId = "ca-app-pub-3940256099942544/1033173712";

  /// Loads an interstitial ad.
  void loadAd({VoidCallback? onAdLoaded}) {
    if (!ksShowAdmobAds) return;
    InterstitialAd.load(
      adUnitId: ksTestAds ? _testAdUnitId : adUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          if (!ksShowAdmobAds) return;
          debugPrint('$ad loaded.');

          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) =>
                checkCountAndShowRemoveAdsDialog(),
          );

          _interstitialAd = ad;
          onAdLoaded?.call();
        },
        onAdFailedToLoad: (LoadAdError err) {
          debugPrint('InterstitialAd failed to load: $err');
        },
      ),
    );
  }
}

class AdmobAppOpenAdsService {
  AdmobAppOpenAdsService._singleton();

  static final AdmobAppOpenAdsService _instance =
      AdmobAppOpenAdsService._singleton();
  static AdmobAppOpenAdsService get instance => _instance;

  AppOpenAd? _appOpenAd;
  bool _isShowingAd = false;

  final String _testAdUnitId = "ca-app-pub-3940256099942544/9257395921";

  void setup() async {
    if (!ksShowAdmobAds) return;
    await AppOpenAd.load(
      adUnitId: ksTestAds ? _testAdUnitId : ksAdmobAppOpen,
      orientation: AppOpenAd.orientationPortrait,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          if (!ksShowAdmobAds) return;

          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) =>
                checkCountAndShowRemoveAdsDialog(),
          );

          _appOpenAd = ad;
        },
        onAdFailedToLoad: (error) {
          debugPrint('AppOpenAd yükleme sorunu: $error');
        },
      ),
    );

    AppLifecycleReactor(appOpenAdManager: this).listenToAppStateChanges();
  }

  bool get isAdAvailable => _appOpenAd != null;

  void showAdIfAvailable() {
    if (!ksShowAdmobAds) return;
    if (!isAdAvailable) {
      debugPrint('Reklam bulunamadığı için yükleniyor.');
      setup();
      return;
    }
    if (_isShowingAd) {
      debugPrint('Reklam mevcut ve gösteriliyor.');
      return;
    }
    _appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        _isShowingAd = true;
        debugPrint('$ad onAdShowedFullScreenContent');
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        debugPrint('$ad onAdFailedToShowFullScreenContent: $error');
        _isShowingAd = false;
        ad.dispose();
        _appOpenAd = null;
      },
      onAdDismissedFullScreenContent: (ad) {
        debugPrint('$ad onAdDismissedFullScreenContent');
        _isShowingAd = false;
        ad.dispose();
        _appOpenAd = null;
        setup();
      },
    );
    _appOpenAd!.show();
  }
}

class AppLifecycleReactor {
  AppLifecycleReactor({required this.appOpenAdManager});
  final AdmobAppOpenAdsService appOpenAdManager;

  void listenToAppStateChanges() {
    AppStateEventNotifier.startListening();
    AppStateEventNotifier.appStateStream
        .forEach((state) => _onAppStateChanged(state));
  }

  void _onAppStateChanged(AppState appState) {
    debugPrint("App State Changed: ${appState.name}");
    if (appState == AppState.foreground) {
      appOpenAdManager.showAdIfAvailable();
    }
  }
}
