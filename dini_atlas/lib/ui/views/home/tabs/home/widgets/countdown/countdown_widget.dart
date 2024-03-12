import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/home/home_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

import 'countdown_viewmodel.dart';

class CountDownWidget extends StatelessWidget {
  final HomeService homeService;
  const CountDownWidget({super.key, required this.homeService});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CountDownViewModel>.reactive(
      viewModelBuilder: () => CountDownViewModel(homeService: homeService),
      onViewModelReady: (viewModel) => viewModel.init(homeService),
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
            AnimatedOpacity(
              duration: const Duration(milliseconds: 350),
              opacity: model.countdownTimer == null ? 0 : 1,
              child: Text(
                model.countdownTimer ?? "",
                style: const TextStyle(
                  fontSize: 26,
                  color: kcOnPrimaryColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
