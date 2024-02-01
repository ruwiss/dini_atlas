import 'package:dini_atlas/ui/widgets/appbar.dart';
import 'package:dini_atlas/ui/widgets/no_internet_widget.dart';
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
        body: const Center(child: NoInternetWidget()),
      ),
    );
  }

  @override
  NoInternetViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      NoInternetViewModel();
}
