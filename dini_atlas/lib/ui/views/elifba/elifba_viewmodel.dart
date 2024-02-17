import 'package:dini_atlas/services/remote/google/admob_service.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:stacked/stacked.dart';

class ElifbaViewModel extends BaseViewModel {
  int _currentPageIndex = 1;
  int get currentPageIndex => _currentPageIndex;

  final _bannerAd = AdmobBannerAdService(adUnitId: ksAdmobBanner3);
  BannerAd? get bannerAd => _bannerAd.bannerAd;
  void _loadBannerAd() => _bannerAd.loadAd(onAdLoaded: () => notifyListeners());

  void init() {
    _loadBannerAd();
  }

  void nextPage() {
    _currentPageIndex++;
    notifyListeners();
  }

  void prevPage() {
    _currentPageIndex--;
    notifyListeners();
  }
}
