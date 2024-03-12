import 'package:dini_atlas/ui/views/home/tabs/home/widgets/countdown/countdown_card.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/home/tabs/home/widgets/default_table_widget.dart';
import 'package:dini_atlas/ui/views/home/tabs/home/widgets/detailed_table_widget.dart';
import 'package:dini_atlas/ui/views/home/tabs/home/widgets/dot_view.dart';
import 'package:dini_atlas/ui/views/home/tabs/home/widgets/story_circle_views.dart';
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
                viewModel: viewModel, homeService: widget.homeService),
            verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DotView(isActive: viewModel.currentTableTab == TableTab.normal),
                DotView(
                    isActive: viewModel.currentTableTab == TableTab.detailed),
              ],
            ),
            verticalSpace(10),
            Flexible(
              child: PageView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return _tableWidgets(viewModel)[index];
                },
                onPageChanged: (value) => viewModel.changeTableTab(value),
              ),
            )
            // TableWidget(viewModel: viewModel),
          ],
        );
      },
    );
  }

  List<Widget> _tableWidgets(HomeTabViewModel viewModel) => [
        DefaultTableWidget(viewModel: viewModel),
        SingleChildScrollView(
          child: Column(
            children: [
              StoryCircleViews(),
              DetailedTableWidget(viewModel: viewModel),
            ],
          ),
        )
      ];

  Align _subtitleWidget() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Esselâmü Aleyküm",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }
}
