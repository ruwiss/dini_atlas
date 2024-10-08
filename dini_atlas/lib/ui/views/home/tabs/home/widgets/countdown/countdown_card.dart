import 'package:dini_atlas/extensions/string_extensions.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/home/home_service.dart';
import 'package:dini_atlas/ui/views/home/tabs/home/widgets/countdown/countdown_widget.dart';
import 'package:dini_atlas/ui/widgets/blend_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../home_tab_viewmodel.dart';

class CountdownCard extends StatelessWidget {
  final HomeTabViewModel viewModel;
  final HomeService homeService;
  const CountdownCard(
      {super.key, required this.viewModel, required this.homeService});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // CardView
          _cardView(),

          // Countdown
          _countdown(),

          // Live Moon Image
          _liveMoon(),

          // Location Text
          _location()
        ],
      ),
    );
  }

  Positioned _location() {
    final bool isBusy = viewModel.busy(viewModel.locationBusy);
    return Positioned(
      right: 13,
      bottom: 9,
      child: InkWell(
        onTap: () {
          if (!isBusy) viewModel.updateLocation();
        },
        child: Row(
          children: [
            Text(
              viewModel.userStateLocation?.ilceAdiEn.capitalize() ?? "",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: kcOnPrimaryColor,
              ),
            ),
            horizontalSpaceTiny,
            !isBusy
                ? SvgPicture.asset(kiLocation)
                : const SizedBox(
                    height: 15,
                    width: 15,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: kcBackgroundColor,
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget _liveMoon() {
    return Positioned(
      top: 3,
      right: 7,
      child: viewModel.currentMoonImage == null
          ? const SizedBox()
          : BlendMask(
              blendMode: BlendMode.screen,
              child: Image.memory(
                viewModel.currentMoonImage!,
                height: 41,
                width: 41,
                cacheHeight: 41,
                cacheWidth: 41,
                errorBuilder: (_, __, ___) => const SizedBox(),
              ),
            ),
    );
  }

  Positioned _countdown() {
    return Positioned(
        left: 20, child: CountDownWidget(homeService: homeService));
  }

  Widget _cardView() {
    return ClipRRect(
      borderRadius: borderRadiusMedium,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 105,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [kcPurpleColorDark, kcPurpleColorMedium],
              ),
            ),
          ),
          Positioned.fill(
            child: BlendMask(
              opacity: .1,
              blendMode: BlendMode.luminosity,
              child: Image.asset(kiMosque, fit: BoxFit.cover),
            ),
          )
        ],
      ),
    );
  }
}
