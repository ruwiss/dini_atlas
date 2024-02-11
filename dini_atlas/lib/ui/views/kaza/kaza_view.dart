import 'package:dini_atlas/ui/views/kaza/widgets/auth_widget.dart';
import 'package:dini_atlas/ui/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'kaza_viewmodel.dart';

class KazaView extends StackedView<KazaViewModel> {
  const KazaView({super.key});

  @override
  Widget builder(
    BuildContext context,
    KazaViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const AppBarWidget(title: "Kaza Çetelesi"),
      body: Center(
        child: viewModel.isBusy
            ? const CircularProgressIndicator()
            : !viewModel.isUserLoggedIn
                ? KazaAuthWidget(viewModel: viewModel)
                : Column(
                    children: [],
                  ),
      ),
    );
  }

  @override
  KazaViewModel viewModelBuilder(BuildContext context) => KazaViewModel();

  @override
  void onViewModelReady(KazaViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.init();
  }
}
