import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/about/about_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({super.key, required this.viewModel});
  final AboutViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpaceLarge,
        _logoView(),
        verticalSpace(20),
        _versionNumberView(),
        verticalSpace(35),
        _subscriptionButton(viewModel),
        verticalSpaceLarge,
        _aboutTiles(),
        const Spacer(),
        Text(
          ksMail,
          style: const TextStyle(fontSize: 13),
        ),
      ],
    );
  }

  
  Column _aboutTiles() {
    return Column(
      children: [
        _aboutTileWidget(
          svg: kiAboutShare,
          text: "Paylaş",
          onTap: () {},
        ),
        _aboutTileWidget(
          svg: kiAboutStar,
          text: "Değerlendir",
          onTap: () {},
        ),
        _aboutTileWidget(
          svg: kiAboutPrivacyPolicy,
          text: "Gizlilik Politikası",
          onTap: () {},
        ),
      ],
    );
  }

  Padding _aboutTileWidget(
      {required String svg, required String text, VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
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
      child: const Card(
        surfaceTintColor: kcGrayColorLightSoft,
        elevation: 2.5,
        child: Padding(
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
