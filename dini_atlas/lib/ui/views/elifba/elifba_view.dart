import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

import 'elifba_viewmodel.dart';

class ElifbaView extends StackedView<ElifbaViewModel> {
  const ElifbaView({super.key});

  @override
  Widget builder(
    BuildContext context,
    ElifbaViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const AppBarWidget(title: "Elif Bâ"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: SingleChildScrollView(
            child: _contentWidget(viewModel),
          ),
        ),
      ),
    );
  }

  Widget _contentWidget(ElifbaViewModel viewModel) {
    return Column(
      children: [
        InteractiveViewer(
          child: Image.asset(
              "assets/docs/elifba/${viewModel.currentPageIndex}.png"),
        ),
        verticalSpaceMedium,
        _actionButtons(viewModel),
        verticalSpace(30),
        Text("Sayfa ${viewModel.currentPageIndex}"),
      ],
    );
  }

  Row _actionButtons(ElifbaViewModel viewModel) {
    final int index = viewModel.currentPageIndex;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: index == 1 ? null : viewModel.prevPage,
          child: const Text("Önceki"),
        ),
        ElevatedButton(
          onPressed: index == 30 ? null : viewModel.nextPage,
          child: const Text("Sonraki"),
        ),
      ],
    );
  }

  @override
  ElifbaViewModel viewModelBuilder(BuildContext context) => ElifbaViewModel();
}
