import 'package:dini_atlas/ui/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';
import 'near_mosques_viewmodel.dart';

class NearMosquesView extends StackedView<NearMosquesViewModel> {
  const NearMosquesView({super.key});

  void _launchUrl() async {
    final url = Uri.parse("https://www.google.com/maps/search/cami");
    await launchUrl(url);
  }

  @override
  Widget builder(
    BuildContext context,
    NearMosquesViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const AppBarWidget(title: "Yakındaki Camiler"),
      body: const Center(child: Text("Yönlendirildi")),
    );
  }

  @override
  NearMosquesViewModel viewModelBuilder(BuildContext context) =>
      NearMosquesViewModel();
  @override
  void onViewModelReady(NearMosquesViewModel viewModel) {
    super.onViewModelReady(viewModel);
    _launchUrl();
  }
}
