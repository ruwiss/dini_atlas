import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/app/app.router.dart';
import 'package:dini_atlas/models/quran/sura_info.dart';
import 'package:dini_atlas/models/user_setting.dart';
import 'package:dini_atlas/services/local/network_checker.dart';
import 'package:dini_atlas/services/local/user_settings_service.dart';
import 'package:dini_atlas/services/remote/google/admob_service.dart';
import 'package:dini_atlas/services/remote/quran_service.dart';
import 'package:dini_atlas/ui/common/constants/app_strings.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

enum QuranTabs {
  sura(0, "Sûre"),
  page(1, "Sayfa"),
  traceable(2, "Takipli");

  final int id;
  final String name;
  const QuranTabs(this.id, this.name);
}

class QuranTabViewModel extends IndexTrackingViewModel {
  final _networkChecker = locator<NetworkChecker>();
  final _userSettingsService = locator<UserSettingsService>();
  final _quranService = locator<QuranService>();
  final _navigationService = locator<NavigationService>();

  final _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  void scrollTop() {
    _scrollController.animateTo(
      _scrollController.position.minScrollExtent,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 300),
    );
  }

  List<SuraInfo>? suraList;

  QuranTabs get currentTab => QuranTabs.values[currentIndex];

  UserSettings? _userSettings;
  UserSettings get userSettings => _userSettings!;
  SavedLastAyah get lastReadAyah => userSettings.savedLastAyah;

  final _bannerAdService = AdmobBannerAdService(adUnitId: ksAdmobBanner1);
  BannerAd? get bannerAd => _bannerAdService.bannerAd;
  void _loadBannerAd() =>
      _bannerAdService.loadAd(onAdLoaded: () => notifyListeners());

  int _interstitialAdLoadLimit = 2;
  final _interstitialAdService =
      AdmobInterstitialAdService(adUnitId: ksAdmobInterstitial1);
  void loadInterstitalAd() {
    if (_interstitialAdLoadLimit > 0) {
      _interstitialAdLoadLimit--;
      _interstitialAdService.loadAd();
    }
  }

  void showInterstitalAl() {
    final interstitialAd = _interstitialAdService.interstitialAd;
    if (interstitialAd != null) interstitialAd.show();
  }

  void init() async {
    _loadBannerAd();
    loadInterstitalAd();
    await runBusyFuture(getUserSettings());
    runBusyFuture(_fetchSuraList());
    _listenSuraScroll();
  }

  Future<void> getUserSettings() async {
    _userSettings = await _userSettingsService.getUserSettings();
    notifyListeners();
  }

  Future<void> _fetchSuraList() async {
    final result = await _quranService.getSuraList();

    result.fold((data) {
      suraList = data;
      notifyListeners();
    }, (error) => setError(error.message));
  }

  void showReviewDialog() async {
    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
  }

  void _listenSuraScroll() => _scrollController.addListener(_onSuraScroll);

  bool _headerVisible = true;
  bool get headerVisible => _headerVisible;

  void _onSuraScroll() {
    if (_scrollController.offset > 100 && _headerVisible) {
      _headerVisible = false;
      notifyListeners();
    } else if (_scrollController.offset < 30 && !_headerVisible) {
      _headerVisible = true;
      notifyListeners();
    }
  }

  void onHeaderTap() {
    final sura = suraList!.singleWhere((e) => e.suraId == lastReadAyah.suraId);
    _navigationService.navigateToQuranView(
      currentTab: QuranTabs.sura,
      sura: sura,
      ayah: lastReadAyah.ayah,
    );
  }

  @override
  void dispose() {
    _networkChecker.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
