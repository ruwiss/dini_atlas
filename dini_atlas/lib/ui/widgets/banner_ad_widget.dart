import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdWidget extends StatelessWidget {
  const BannerAdWidget({super.key, this.bannerAd, this.padding});
  final BannerAd? bannerAd;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: padding ?? EdgeInsets.zero, child: _buildBanner());
  }

  Widget _buildBanner() {
    if (bannerAd != null) {
      return SizedBox(
        width: bannerAd!.size.width.toDouble(),
        height: bannerAd!.size.height.toDouble(),
        child: AdWidget(ad: bannerAd!),
      );
    } else {
      return const SizedBox();
    }
  }
}
