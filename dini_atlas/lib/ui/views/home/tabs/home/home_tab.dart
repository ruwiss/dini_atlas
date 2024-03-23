import 'package:dini_atlas/ui/views/home/tabs/home/widgets/countdown/countdown_card.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/home/tabs/home/widgets/table_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

import '../../home_service.dart';
import 'home_tab_viewmodel.dart';

class HomeTabView extends StatefulWidget {
  final HomeService homeService;
  const HomeTabView({super.key, required this.homeService});
  @override
  HomeTabViewState createState() => HomeTabViewState();
}

class HomeTabViewState extends State<HomeTabView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeTabViewModel>.reactive(
      viewModelBuilder: () => HomeTabViewModel(homeService: widget.homeService),
      onViewModelReady: (viewModel) => viewModel.init(),
      builder: (
        BuildContext context,
        HomeTabViewModel viewModel,
        Widget? child,
      ) {
        return Column(
          children: [
            verticalSpaceSmall,
            _subtitleWidget(),
            verticalSpace(15),
            CountdownCard(
              viewModel: viewModel,
              homeService: widget.homeService,
            ),
            verticalSpaceMedium,
            Flexible(
              child: SingleChildScrollView(
                child: TableWidget(viewModel: viewModel),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _subtitleWidget() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Esselâmü Aleyküm",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
