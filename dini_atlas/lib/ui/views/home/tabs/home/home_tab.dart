import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/home/tabs/home/widgets/countdown_card.dart';
import 'package:dini_atlas/ui/views/home/tabs/home/widgets/table_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_tab_viewmodel.dart';

class HomeTab extends StackedView<HomeTabViewModel> {
  const HomeTab({super.key});

  @override
  Widget builder(
    BuildContext context,
    HomeTabViewModel viewModel,
    Widget? child,
  ) {
    return Column(
      children: [
        verticalSpaceSmall,
        _subtitleWidget(),
        verticalSpace(15),
        const CountdownCard(),
        verticalSpace(30),
        const TableWidget(),
      ],
    );
  }

  Align _subtitleWidget() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Esselâmü Aleyküm",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }

  @override
  HomeTabViewModel viewModelBuilder(BuildContext context) => HomeTabViewModel();

  @override
  void onViewModelReady(HomeTabViewModel viewModel) {
    // init();
  }
}
