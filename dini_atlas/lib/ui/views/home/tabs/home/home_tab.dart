import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/home/tabs/home/widgets/countdown/countdown_card.dart';
import 'package:dini_atlas/ui/views/home/tabs/home/widgets/table_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:stacked/stacked.dart';
import 'home_tab_viewmodel.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({super.key});
  @override
  HomeTabViewState createState() => HomeTabViewState();
}

class HomeTabViewState extends State<HomeTabView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeTabViewModel>.reactive(
      viewModelBuilder: () => HomeTabViewModel(),
      onViewModelReady: (viewModel) async {
        await viewModel.init();
        FlutterNativeSplash.remove();
      },
      builder: (
        BuildContext context,
        HomeTabViewModel model,
        Widget? child,
      ) {
        return Column(
          children: [
            verticalSpaceSmall,
            _subtitleWidget(),
            verticalSpace(15),
            CountdownCard(viewModel: model),
            verticalSpace(30),
            TableWidget(viewModel: model),
          ],
        );
      },
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
}
