import 'package:diniatlas/utils/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class OnBoardingTitle extends StatelessWidget {
  const OnBoardingTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        children: [
          Text(
            'Dinî Atlas',
            style: context.textTheme.displayLarge,
          ),
          const SizedBox(height: 15),
          Text(
            "Namazdan Kuran'a, Her An Yanınızda!",
            textAlign: TextAlign.center,
            style: context.textTheme.displayMedium,
          ),
        ],
      ),
    );
  }
}
