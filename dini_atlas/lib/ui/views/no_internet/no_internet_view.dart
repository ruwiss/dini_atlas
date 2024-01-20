import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'no_internet_viewmodel.dart';

class NoInternetView extends StackedView<NoInternetViewModel> {
  const NoInternetView({super.key});

  @override
  Widget builder(
    BuildContext context,
    NoInternetViewModel viewModel,
    Widget? child,
  ) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: const AppBarWidget(title: "İnternet Yok", hideBackButton: true),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Container(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Image.asset(kiNoInternetGif),
                ),
                const Text(
                  "Üzgünüm",
                  style: TextStyle(
                    color: kcGrayColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                verticalSpaceMedium,
                const Text(
                  "Şuanda bir internet bağlantısına ihtiyacınız var.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kcGrayColor, fontSize: 18),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  NoInternetViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      NoInternetViewModel();
}
