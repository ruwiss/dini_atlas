import 'dart:async';
import 'package:dini_atlas/extensions/num_extensions.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/widgets/appbar.dart';
import 'package:dini_atlas/ui/widgets/location_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import 'compass_viewmodel.dart';
import 'dart:math' as math;

class CompassView extends StackedView<CompassViewModel> {
  CompassView({super.key});

  @override
  Widget builder(
    BuildContext context,
    CompassViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBarWidget(
        title: "Kıble Pusulası",
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.map_outlined)),
        ],
      ),
      body: Center(
        child: Padding(
          padding: paddingMassive,
          child: viewModel.isBusy
              ? const CircularProgressIndicator()
              : !viewModel.locationPermission
                  ? LocationErrorWidget(
                      message: "Kıble pusulası için konum izni gerekiyor.",
                      onRetry: () => viewModel.checkLocationPermission(),
                    )
                  : viewModel.deviceSupport
                      ? _qiblaCompass(viewModel)
                      : const Text("Maps"),
        ),
      ),
    );
  }

  Widget _qiblaCompass(CompassViewModel viewModel) {
    return StreamBuilder(
      stream: FlutterQiblah.qiblahStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        final QiblahDirection qiblahDirection = snapshot.data!;
        final double angle = (qiblahDirection.qiblah).degreesToRadians() * -1;

        final int diff =
            (qiblahDirection.offset - qiblahDirection.direction).toInt();

        final bool isCorrectDirection = diff > -45 && diff < 45;

        final bool isLeft = diff > 180;

        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Manyetik Alan: %${viewModel.magneticPercentage}"),
            Text(
              "${qiblahDirection.offset.toStringAsFixed(3)}°",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: kcPrimaryColorDark,
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle: angle,
                  child: SvgPicture.asset(kiCompassCircle),
                ),
                Transform.rotate(
                  angle: angle,
                  child: SvgPicture.asset(kiCompassPlaceholder),
                ),
              ],
            ),
            Column(
              children: [
                Icon(
                  isCorrectDirection
                      ? Icons.check
                      : isLeft
                          ? Icons.arrow_back_rounded
                          : Icons.arrow_forward_rounded,
                  color: kcGrayColor,
                ),
                verticalSpace(15),
                Text(
                  isCorrectDirection
                      ? "Kıble Yönü"
                      : "Cihazı ${isLeft ? 'Sola' : 'Sağa'} Çevir",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: kcPrimaryColorDark,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  CompassViewModel viewModelBuilder(BuildContext context) => CompassViewModel();

  @override
  void onViewModelReady(CompassViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(CompassViewModel viewModel) {
    FlutterQiblah().dispose();
    super.onDispose(viewModel);
  }
}
