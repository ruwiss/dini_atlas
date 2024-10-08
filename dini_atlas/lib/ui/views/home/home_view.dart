import 'package:dini_atlas/services/remote/google/admob_service.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/views/home/tabs/categories/categories_tab.dart';
import 'package:dini_atlas/ui/views/home/tabs/home/home_tab.dart';
import 'package:dini_atlas/ui/widgets/appbar.dart';
import 'package:dini_atlas/ui/widgets/bottom_nav_container.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home_service.dart';
import 'home_viewmodel.dart';
import 'tabs/home/widgets/notifications_overlay_widget.dart';
import 'tabs/quran/quran_tab.dart';

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
      onViewModelReady: (viewModel) {
        viewModel.init(_homeService);
        // Uygulama açılış reklamı kurulumu
        AdmobAppOpenAdsService.instance.setup();
      },
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBarWidget(
          title: ksAppName,
          leading: IconButton(
            onPressed: viewModel.onAboutTap,
            icon: SvgPicture.asset(kiMenu),
          ),
          actions: [
            if (viewModel.isHomePage) ...[
              NotificationsOverlayWidget(
                viewModel: viewModel,
                controller: viewModel.notificationsOverlayController,
                child: IconButton(
                  onPressed: viewModel.onTapNotificationsMenu,
                  icon: const Icon(Icons.notifications),
                ),
              ),
              IconButton(
                onPressed: viewModel.onSettingsTap,
                icon: SvgPicture.asset(kiSettings),
              ),
            ]
          ],
        ),
        body: SafeArea(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: getViewForIndex(viewModel.currentIndex),
          ),
        ),
        bottomNavigationBar: _bottomNavigationBar(context, viewModel),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }

  Widget _bottomNavigationBar(BuildContext context, HomeViewModel viewModel) {
    return BottomNavContainer(
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
                viewModel.isIndexSelected(index) ? kcPrimaryColor : kcGrayColor,
                BlendMode.srcIn,
              ),
            ),
            label: viewModel.tabItems[index],
          ),
        ),
      ),
    );
  }

  void _logScreenView(String name) {
    FirebaseAnalytics.instance
        .logScreenView(screenName: name, screenClass: 'home');
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 2:
        _logScreenView("kuran_tab");
        return const QuranTab();
      case 1:
        _logScreenView("categories_tab");
        return const CategoriesTab();
      default:
        _logScreenView("home_tab");
        return HomeTabView(homeService: _homeService);
    }
  }
}
