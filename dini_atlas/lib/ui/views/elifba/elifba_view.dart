import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'elifba_viewmodel.dart';

class ElifbaView extends StackedView<ElifbaViewModel> {
  const ElifbaView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ElifbaViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  ElifbaViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ElifbaViewModel();
}
