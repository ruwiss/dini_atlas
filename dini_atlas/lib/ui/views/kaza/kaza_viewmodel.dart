import 'package:account_picker/account_picker.dart';
import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/models/kaza/kaza.dart';
import 'package:dini_atlas/models/user_setting.dart';
import 'package:dini_atlas/services/local/network_checker.dart';
import 'package:dini_atlas/services/local/user_settings_service.dart';
import 'package:dini_atlas/services/remote/google/admob_service.dart';
import 'package:dini_atlas/services/remote/kaza_service.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

enum KazaType { sabah, ogle, ikindi, aksam, yatsi, vitir, oruc }

class KazaViewModel extends FormViewModel {
  final networkChecker = locator<NetworkChecker>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _userSettingsService = locator<UserSettingsService>();
  final _kazaService = locator<KazaService>();

  final _bannerAd = AdmobBannerAdService(adUnitId: ksAdmobBanner4);
  BannerAd? get bannerAd => _bannerAd.bannerAd;
  void _loadBannerAd() => _bannerAd.loadAd(onAdLoaded: () => notifyListeners());

  final _interstitialAdService =
      AdmobInterstitialAdService(adUnitId: ksAdmobInterstitial2);

  void _loadInterstitialAdAndShow() {
    _interstitialAdService.loadAd(
      onAdLoaded: () => _interstitialAdService.interstitialAd?.show(),
    );
  }

  late UserSettings _userSettings;
  bool get isUserLoggedIn => _userSettings.userMail != null;

  String? _userMail;

  Kaza? _kaza;
  Kaza? _oldKaza;
  Kaza? get kaza => _kaza;

  void init() async {
    _loadBannerAd();
    runBusyFuture(_getUserSettings());
  }

  Future<void> _getUserSettings() async {
    _userSettings = (await _userSettingsService.getUserSettings())!;
    if (isUserLoggedIn) {
      _userMail = _userSettings.userMail!;
      await _getUserKaza();
    }
  }

  Future<void> authUser() async {
    final emailResult = await AccountPicker.emailHint();
    if (emailResult == null) {
      setError("Mail hesabınız seçilirken sorun oluştu");
      return;
    } else {
      _userMail = emailResult.email;
      _userSettings = await _userSettingsService.setUserMail(_userMail!);
      notifyListeners();

      FirebaseMessaging.instance.subscribeToTopic("kaza");
      // kullanıcı kaza bilgilerini getir
      runBusyFuture(_getUserKaza());
    }
  }

  Future<void> _getUserKaza() async {
    final result = await _kazaService.getUserKaza(_userMail!);
    _kaza = result ?? Kaza.createEmpty();
    _oldKaza = kaza;
    notifyListeners();
  }

  void updateKaza(Kaza kaza) {
    _kaza = kaza;
    notifyListeners();
  }

  void saveKazaData() async {
    _loadInterstitialAdAndShow();
    kaza!.lastUpdated = DateTime.now();
    setBusy(true);
    final result =
        await _kazaService.setUserKaza(mail: _userMail!, kaza: kaza!);
    setBusy(false);
    notifyListeners();
    if (result) {
      _bottomSheetService.showBottomSheet(
        title: "Başarılı",
        description: "Kaza bilgileri kaydedildi",
        confirmButtonTitle: "Kapat",
      );
      _oldKaza = kaza;
    } else {
      _bottomSheetService.showBottomSheet(
        title: "Bir sorun oluştu",
        description:
            "Sanırım sunucuyla ilgili bir problem var. Bilgilerinizi birazdan tekrar kaydetmeyi deneyin. İletişim: $ksMail",
        confirmButtonTitle: "Anladım",
      );
    }
  }

  final List<int> _kazaMultiCounts = [1, 5, 10, 25, 50, 100];
  int _kazaMultiCount = 1;
  int get kazaMultiCount => _kazaMultiCount;

  void changeKazaMultiCount() {
    int nextIndex = _kazaMultiCounts.indexOf(_kazaMultiCount) + 1;
    if (nextIndex > _kazaMultiCounts.length - 1) nextIndex = 0;
    _kazaMultiCount = _kazaMultiCounts[nextIndex];
    notifyListeners();
  }

  int? findDifference(KazaType kazaType) {
    if (kaza == null || _oldKaza == null) return null;
    final val = switch (kazaType) {
      KazaType.sabah => kaza!.sabah - _oldKaza!.sabah,
      KazaType.ogle => kaza!.ogle - _oldKaza!.ogle,
      KazaType.ikindi => kaza!.ikindi - _oldKaza!.ikindi,
      KazaType.aksam => kaza!.aksam - _oldKaza!.aksam,
      KazaType.yatsi => kaza!.yatsi - _oldKaza!.yatsi,
      KazaType.vitir => kaza!.vitir - _oldKaza!.vitir,
      KazaType.oruc => kaza!.oruc - _oldKaza!.oruc,
    };
    if (val == 0) return null;
    return val;
  }

  @override
  void dispose() {
    networkChecker.dispose();
    super.dispose();
  }
}
