import 'package:diniatlas/domain/cubits/menu/menu_cubit.dart';
import 'package:diniatlas/utils/constants/images.dart';
import 'package:diniatlas/utils/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/svg.dart';

import '../shared/widgets/appbar.dart';
import 'pages/categories/categories_page.dart';
import 'pages/home/home_page.dart';
import 'pages/quran/quran_page.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  void _onTapMenu() {}

  void _onTapHomeSettings() {}

  void _onTapQuranSettings() {}

  void _tabIndexListener() {
    context.read<MenuCubit>().changeMenuIndex(_tabController.index);
  }

  @override
  void initState() {
    FlutterNativeSplash.remove();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_tabIndexListener);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.removeListener(_tabIndexListener);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int tabIndex = context.watch<MenuCubit>().state;
    return Scaffold(
      appBar: AppBarWidget(
        title: "Dinî Atlas",
        leading: IconButton(
          onPressed: _onTapMenu,
          icon: SvgPicture.asset(AppVectors.menu),
        ),
        actions: [
          if ([0, 2].contains(tabIndex))
            IconButton(
              onPressed: () {
                if (tabIndex == 0) _onTapHomeSettings();
                if (tabIndex == 2) _onTapQuranSettings();
              },
              icon: SvgPicture.asset(AppVectors.settings),
            ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                HomePage(),
                CategoriesPage(),
                QuranPage(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(tabIndex, context),
    );
  }

  Widget _bottomNavigationBar(int tabIndex, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.background,
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.shadow,
            spreadRadius: 0,
            blurRadius: 16,
            offset: const Offset(0, -1),
          )
        ],
      ),
      child: TabBar(
        controller: _tabController,
        dividerColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        tabs: List.generate(
          AppVectors.tabItems.length,
          (index) {
            final color = tabIndex != index
                ? context.colorScheme.onBackground
                : context.colorScheme.primary;
            return Tab(
              icon: SvgPicture.asset(
                AppVectors.tabItems[index],
                colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
              ),
            );
          },
        ),
      ),
    );
  }
}
