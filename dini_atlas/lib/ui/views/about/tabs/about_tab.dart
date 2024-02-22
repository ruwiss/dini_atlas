import 'package:dini_atlas/services/remote/google/firebase_remote_config_service.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/about/about_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({super.key, required this.viewModel});
  final AboutViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          verticalSpaceMedium,
          _logoView(),
          verticalSpace(15),
          _versionNumberView(),
          verticalSpace(30),
          _subscriptionButton(viewModel),
          verticalSpace(30),
          _aboutTiles(),
          verticalSpaceMedium,
          Text(
            ksMail,
            style: const TextStyle(fontSize: 13),
          ),
          verticalSpaceSmall,
        ],
      ),
    );
  }

  Column _aboutTiles() {
    return Column(
      children: [
        _aboutTileWidget(
          svg: kiAboutShare,
          text: "Paylaş",
          onTap: () => Share.shareUri(Uri.parse(ksAppUrl)),
        ),
        _aboutTileWidget(
          svg: kiAboutStar,
          text: "Değerlendir",
          onTap: () => launchUrl(Uri.parse(ksAppUrl)),
        ),
        _aboutTileWidget(
          svg: kiAboutPrivacyPolicy,
          text: "Gizlilik Politikası",
          onTap: () => launchUrl(
            Uri.parse(FirebaseRemoteConfigServiceClass.i.privacyPolicy),
            mode: LaunchMode.externalApplication,
          ),
        ),
      ],
    );
  }

  Padding _aboutTileWidget(
      {required String svg, required String text, VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadiusMedium,
        highlightColor: kcPrimaryColorLight.withOpacity(.15),
        child: Ink(
          decoration: BoxDecoration(
            color: kcGrayColorLightSoft,
            borderRadius: borderRadiusMedium,
          ),
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(svg),
              Text(
                text,
                style: const TextStyle(color: kcPrimaryColorDark),
              ),
              const Icon(Icons.arrow_forward, color: kcPrimaryColorDark)
            ],
          ),
        ),
      ),
    );
  }

  Widget _subscriptionButton(AboutViewModel viewModel) {
    return InkWell(
      onTap: viewModel.onRemoveAdsButtonTap,
      borderRadius: BorderRadius.circular(15),
      highlightColor: kcPrimaryColorLight.withOpacity(.2),
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: kcBlueGrayColorSoft,
          boxShadow: [
            BoxShadow(
              color: kcPrimaryColor.withOpacity(.5),
              blurRadius: 5.0,
              offset: const Offset(0, 0),
            )
          ],
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Reklamları Kaldır",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: kcPrimaryColorDark,
                ),
              ),
              verticalSpaceTiny,
              Text(
                "Reklamları tamamen kaldırmak ve bize destek olmak için tıklayın",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text _versionNumberView() {
    return const Text(
      "Sürüm: $ksAppVersion",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  SizedBox _logoView() {
    return SizedBox(
      height: 172,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Image.asset(
          kiLogo,
        ),
      ),
    );
  }
}
