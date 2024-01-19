import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/widgets/blend_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CountdownCard extends StatelessWidget {
  const CountdownCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }

  Positioned _location() {
    return Positioned(
      right: 13,
      bottom: 9,
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            const Text(
              "Konya",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: kcOnPrimaryColor,
              ),
            ),
            horizontalSpaceTiny,
            SvgPicture.asset(kiLocation)
          ],
        ),
      ),
    );
  }

  Positioned _liveMoon() {
    return Positioned(
      top: 3,
      right: 7,
      child: BlendMask(
        blendMode: BlendMode.screen,
        child: Image.network(
          "http://10.0.2.2:5000/aygoruntusu",
          headers: const {
            "ref": "https://namazvakti.diyanet.gov.tr/images/i2.gif"
          },
          height: 41,
          errorBuilder: (context, error, stackTrace) => const SizedBox(),
        ),
      ),
    );
  }

  Positioned _countdown() {
    return Positioned(
      left: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Sonraki Vakit",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: kcOnPrimaryColor,
            ),
          ),
          verticalSpace(2),
          const Text(
            "02:46:59",
            style: TextStyle(
              fontSize: 26,
              color: kcOnPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Stack _cardView() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 105,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: borderRadiusMedium,
            gradient: const LinearGradient(
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
            child: Image.asset(kiMosque),
          ),
        )
      ],
    );
  }
}
