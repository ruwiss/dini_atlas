import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/models/quran/sura_info.dart';
import 'package:dini_atlas/models/user_setting.dart';
import 'package:dini_atlas/services/local/network_checker.dart';
import 'package:dini_atlas/services/local/user_settings_service.dart';
import 'package:dini_atlas/services/remote/google/admob_service.dart';
import 'package:dini_atlas/services/remote/quran_service.dart';
import 'package:dini_atlas/ui/common/constants/app_strings.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:stacked/stacked.dart';

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
  List<SuraInfo>? suraList;

  QuranTabs get currentTab => QuranTabs.values[currentIndex];

  UserSettings? _userSettings;
  UserSettings get userSettings => _userSettings!;
  LastReadAyah get lastReadAyah => userSettings.lastReadAyah;

  final _bannerAdService = AdmobBannerAdService(adUnitId: ksAdmobBanner1);
  BannerAd? get bannerAd => _bannerAdService.bannerAd;
  void _loadBannerAd() =>
      _bannerAdService.loadAd(onAdLoaded: () => notifyListeners());

  final _interstitialAdService =
      AdmobInterstitialAdService(adUnitId: ksAdmobInterstitial1);
  void loadInterstitalAd() => _interstitialAdService.loadAd();

  void showInterstitalAl() {
    final interstitialAd = _interstitialAdService.interstitialAd;
    if (interstitialAd != null) interstitialAd.show();
  }

  void init() async {
    _loadBannerAd();
    loadInterstitalAd();
    await runBusyFuture(_getUserSettings());
    runBusyFuture(_fetchSuraList());
  }

  Future<void> _getUserSettings() async {
    _userSettings = await _userSettingsService.getUserSettings();
  }

  Future<void> _fetchSuraList() async {
    final result = await _quranService.getSuraList();

    result.fold((data) {
      suraList = data;
      notifyListeners();
    }, (error) => setError(error.message));
  }

  @override
  void dispose() {
    _networkChecker.dispose();
    super.dispose();
  }
}
