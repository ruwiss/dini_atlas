import 'package:diniatlas/utils/constants/images.dart';
import 'package:diniatlas/utils/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class OnBoardingImage extends StatelessWidget {
  const OnBoardingImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 267,
      height: 254,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: const DecorationImage(
            image: AssetImage(AppImages.logo), fit: BoxFit.cover),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            context.colorScheme.primary,
            context.colorScheme.secondaryContainer.withOpacity(.7),
            context.colorScheme.secondaryContainer.withOpacity(.2),
          ],
        ),
      ),
    );
  }
}
