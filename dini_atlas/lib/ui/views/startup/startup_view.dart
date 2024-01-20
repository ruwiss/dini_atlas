import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({super.key});

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Center(
        child: Builder(
          builder: (context) {
            if (viewModel.hasError) {
              return _locationErrorWidget(
                  context, viewModel.modelError.toString(), viewModel);
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  verticalSpaceMedium,
                  const Spacer(),
                  _startupTitle(context),
                  verticalSpaceLarge,
                  _startupImage(context),
                  verticalSpace(40),
                  _startupButton(context, viewModel),
                  const Spacer(),
                  _startupPrivacyPolicy(),
                  verticalSpaceMedium,
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _startupTitle(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        children: [
          const Text(
            'Dinî Atlas',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: kcPrimaryColor,
            ),
          ),
          verticalSpace(15),
          const Text(
            "Namazdan Kuran'a, Her An Yanınızda!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget _startupImage(BuildContext context) {
    return Container(
      width: screenHeight(context) * .4,
      height: screenHeight(context) * .4,
      decoration: BoxDecoration(
        borderRadius: borderRadiusLarge,
        image: const DecorationImage(
          image: AssetImage(kiLogo),
          fit: BoxFit.fitWidth,
        ),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            kcPurpleColorDark,
            kcPurpleColorMedium,
            kcPurpleColorLight,
          ],
        ),
      ),
    );
  }

  Widget _startupButton(BuildContext context, StartupViewModel viewModel) {
    if (viewModel.isBusy) {
      return const CircularProgressIndicator();
    } else {
      return InkWell(
        onTap: viewModel.getDatas,
        borderRadius: borderRadiusLarge,
        splashColor: kcPurpleColorDark,
        child: Ink(
          decoration: BoxDecoration(
            color: kcPurpleColorMedium,
            borderRadius: borderRadiusLarge,
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            child: Text(
              "Devam Et",
              style: TextStyle(
                color: kcBackgroundColor,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _locationErrorWidget(
    BuildContext context,
    String errorMessage,
    StartupViewModel viewModel,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 250,
          child: Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),
        ),
        verticalSpaceSmall,
        TextButton.icon(
          onPressed: viewModel.getDatas,
          icon: const Icon(Icons.location_disabled),
          label: const Text(
            "Yeniden Dene",
            style: TextStyle(fontSize: 16),
          ),
        )
      ],
    );
  }

  TextButton _startupPrivacyPolicy() {
    return TextButton(
      onPressed: () {},
      child: const Text(
        "Gizlilik Politikası",
        style: TextStyle(
          color: kcGrayColor,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) =>
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        viewModel.checkLocation();
      });
}
