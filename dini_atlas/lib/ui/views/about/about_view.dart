import 'package:dini_atlas/ui/views/about/tabs/about_tab.dart';
import 'package:dini_atlas/ui/views/about/tabs/subscription_tab.dart';
import 'package:dini_atlas/ui/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'about_viewmodel.dart';

class AboutView extends StackedView<AboutViewModel> {
  const AboutView({super.key, this.showSubscriptionView = false});
  final bool showSubscriptionView;

  @override
  Widget builder(
    BuildContext context,
    AboutViewModel viewModel,
    Widget? child,
  ) {
    final bool showSubscriptionView = viewModel.showSubscriptionView;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBarWidget(
        title: !showSubscriptionView ? "Dinî Atlas" : "Abonelik",
        hideBackButton: true,
        leading: IconButton(
          onPressed: viewModel.onBackButtonTap,
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: !showSubscriptionView
              // Hakkımda Sayfası
              ? AboutTab(viewModel: viewModel)
              // Abonelik Sayfası
              : SubscriptionTab(viewModel: viewModel),
        ),
      ),
    );
  }

  @override
  AboutViewModel viewModelBuilder(BuildContext context) => AboutViewModel();

  @override
  void onViewModelReady(AboutViewModel viewModel) {
    viewModel.init(showSubscriptionView: showSubscriptionView);
    super.onViewModelReady(viewModel);
  }
}
