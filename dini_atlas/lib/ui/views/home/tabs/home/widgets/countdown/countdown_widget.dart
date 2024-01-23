import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'countdown_viewmodel.dart';

class CountDownWidget extends StatelessWidget {
  const CountDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CountDownViewModel>.reactive(
      viewModelBuilder: () => CountDownViewModel(),
      onViewModelReady: (viewModel) => viewModel.init(),
      builder: (
        BuildContext context,
        CountDownViewModel model,
        Widget? child,
      ) {
        return Column(
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
            Text(
              model.countdownTimer ?? "",
              style: const TextStyle(
                fontSize: 26,
                color: kcOnPrimaryColor,
              ),
            ),
          ],
        );
      },
    );
  }
}
