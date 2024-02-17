import 'dart:convert';

import 'package:dini_atlas/services/remote/google/admob_service.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:stacked/stacked.dart';

class EsmaulHusnaViewModel extends BaseViewModel {
  final _bannerAd = AdmobBannerAdService(adUnitId: ksAdmobBanner2);
  BannerAd? get bannerAd => _bannerAd.bannerAd;
  void _loadBannerAd() => _bannerAd.loadAd(onAdLoaded: () => notifyListeners());

  void init() {
    _loadBannerAd();
  }

  Future<List<EsmaulHusna>> getEsmaulHusnaData() async {
    final dataString =
        await rootBundle.loadString('assets/docs/esmaul_husna.json');
    final List dataList = jsonDecode(dataString);

    return dataList.map((e) => EsmaulHusna.fromJson(e)).toList();
  }
}

class EsmaulHusna {
  final String text;
  final String mean;

  EsmaulHusna(this.text, this.mean);

  EsmaulHusna.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        mean = json['mean'];
}
