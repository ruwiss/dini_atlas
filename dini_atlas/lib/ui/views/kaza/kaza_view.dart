import 'package:dini_atlas/ui/views/kaza/widgets/auth_widget.dart';
import 'package:dini_atlas/ui/views/kaza/widgets/table_widget.dart';
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
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 24),
                    child: Column(
                      children: [
                        const KazaTableWidget(),
                        const Spacer(),
                        _lastModificationWidget(),
                        const Spacer(),
                      ],
                    ),
                  ),
      ),
    );
  }

  Column _lastModificationWidget() {
    return const Column(
      children: [
        Text(
          "Son Kayıt",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text("16/01/2024 23:25"),
      ],
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
