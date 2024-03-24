import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:page_flip/page_flip.dart';
import 'package:stacked/stacked.dart';

import '../../../services/remote/google/admob_service.dart';

class YasinViewModel extends BaseViewModel {
  final controller = GlobalKey<PageFlipWidgetState>();


  final _interstitialAdService =
      AdmobInterstitialAdService(adUnitId: ksAdmobInterstitital3);

  void init() {
    _interstitialAdService.loadAd();
  }

  void goToPage(int number) async {
    await controller.currentState?.goToPage(number);
    _interstitialAdService.interstitialAd?.show();
  }
}
