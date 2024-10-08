import 'package:dini_atlas/services/local/location_service.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/widgets/location_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({super.key, this.justLogo = false});
  final bool justLogo;

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
            if (viewModel.hasError &&
                viewModel.modelError is LocationException) {
              return LocationErrorWidget(
                message: viewModel.modelError.message,
                onRetry: viewModel.getDatas,
              );
            } else {
              return SingleChildScrollView(
                child: Padding(
                  padding: paddingLarge,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      verticalSpaceTiny,
                      Column(
                        mainAxisAlignment: justLogo
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.start,
                        children: [
                          _startupTitle(context),
                          verticalSpace(40),
                          _startupImage(context),
                          verticalSpace(30),
                          if (!justLogo)
                            viewModel.isBusy
                                ? const Padding(
                                    padding: EdgeInsets.only(bottom: 20),
                                    child: CircularProgressIndicator(),
                                  )
                                : _actionButtons(context, viewModel),
                        ],
                      ),
                      if (!justLogo) _startupPrivacyPolicy(),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Column _actionButtons(BuildContext context, StartupViewModel viewModel) {
    return Column(
      children: [
        _startupButton(
          context,
          text: "Konum Bul",
          onTap: viewModel.getDatas,
        ),
        verticalSpaceMedium,
        _startupButton(
          context,
          text: "Manuel Seçim",
          color: kcPrimaryColor.withOpacity(.5),
          onTap: viewModel.manuelFetchLocationCountry,
        ),
      ],
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
          Text(
            justLogo
                ? "Tekrar Hoş Geldiniz"
                : "Namazdan Kuran'a, Her An Yanınızda!",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
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

  Widget _startupButton(
    BuildContext context, {
    Color? color,
    VoidCallback? onTap,
    required String text,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: borderRadiusLarge,
      splashColor: kcPurpleColorDark,
      child: Ink(
        decoration: BoxDecoration(
          color: color ?? kcPurpleColorMedium,
          borderRadius: borderRadiusLarge,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          child: Text(
            text,
            style: const TextStyle(
              color: kcBackgroundColor,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  Widget _startupPrivacyPolicy() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: TextButton(
        onPressed: () => launchUrl(Uri.parse(ksPrivacyPolicy)),
        child: const Text(
          "Gizlilik Politikası",
          style: TextStyle(
            color: kcGrayColor,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(BuildContext context) => StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) =>
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        viewModel.checkLocation(delayed: justLogo);
      });
}
