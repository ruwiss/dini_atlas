import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/views/home/tabs/home/home_tab.dart';
import 'package:dini_atlas/ui/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home_service.dart';
import 'home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeService _homeService = HomeService();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onViewModelReady: (viewModel) => viewModel.init(_homeService),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBarWidget(
          title: ksAppName,
          leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(kiMenu),
          ),
          actions: [
            if (viewModel.showSettingsIcon)
              IconButton(
                onPressed: viewModel.onSettingsTap,
                icon: SvgPicture.asset(kiSettings),
              )
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
              child: getViewForIndex(viewModel.currentIndex),
            ),
          ),
        ),
        bottomNavigationBar: _bottomNavigationBar(context, viewModel),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }

  Widget _bottomNavigationBar(BuildContext context, HomeViewModel viewModel) {
    return Container(
      decoration: BoxDecoration(
        color: kcBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: kcShadowColor.withOpacity(.2),
            spreadRadius: 0,
            blurRadius: 16,
            offset: const Offset(0, -1),
          )
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: kcBackgroundColor,
        currentIndex: viewModel.currentIndex,
        onTap: viewModel.setIndex,
        items: List.generate(
          viewModel.tabItems.length,
          (index) => BottomNavigationBarItem(
            icon: SvgPicture.asset(
              viewModel.tabItems[index],
              colorFilter: ColorFilter.mode(
                  viewModel.isIndexSelected(index)
                      ? kcPrimaryColor
                      : kcGrayColor,
                  BlendMode.srcIn),
            ),
            label: viewModel.tabItems[index],
          ),
        ),
      ),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 2:
        return const Text("sayfa3");
      case 1:
        return const Text("sayfa2");
      default:
        return HomeTabView(homeService: _homeService);
    }
  }
}
