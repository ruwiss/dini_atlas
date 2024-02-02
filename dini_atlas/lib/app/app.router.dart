// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dini_atlas/models/quran/sura_info.dart' as _i8;
import 'package:dini_atlas/ui/views/home/home_view.dart' as _i2;
import 'package:dini_atlas/ui/views/home/tabs/quran/quran_tab_viewmodel.dart'
    as _i9;
import 'package:dini_atlas/ui/views/no_internet/no_internet_view.dart' as _i4;
import 'package:dini_atlas/ui/views/quran/quran_view.dart' as _i5;
import 'package:dini_atlas/ui/views/startup/startup_view.dart' as _i3;
import 'package:flutter/foundation.dart' as _i7;
import 'package:flutter/material.dart' as _i6;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i10;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const noInternetView = '/no-internet-view';

  static const quranView = '/quran-view';

  static const all = <String>{
    homeView,
    startupView,
    noInternetView,
    quranView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.noInternetView,
      page: _i4.NoInternetView,
    ),
    _i1.RouteDef(
      Routes.quranView,
      page: _i5.QuranView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.NoInternetView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.NoInternetView(),
        settings: data,
      );
    },
    _i5.QuranView: (data) {
      final args = data.getArgs<QuranViewArguments>(nullOk: false);
      return _i6.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => _i5.QuranView(
            key: args.key, sura: args.sura, currentTab: args.currentTab),
        settings: data,
        transitionsBuilder:
            data.transition ?? _i1.TransitionsBuilders.slideLeftWithFade,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class QuranViewArguments {
  const QuranViewArguments({
    this.key,
    required this.sura,
    required this.currentTab,
  });

  final _i7.Key? key;

  final _i8.SuraInfo sura;

  final _i9.QuranTabs currentTab;

  @override
  String toString() {
    return '{"key": "$key", "sura": "$sura", "currentTab": "$currentTab"}';
  }

  @override
  bool operator ==(covariant QuranViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.sura == sura &&
        other.currentTab == currentTab;
  }

  @override
  int get hashCode {
    return key.hashCode ^ sura.hashCode ^ currentTab.hashCode;
  }
}

extension NavigatorStateExtension on _i10.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNoInternetView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.noInternetView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToQuranView({
    _i7.Key? key,
    required _i8.SuraInfo sura,
    required _i9.QuranTabs currentTab,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.quranView,
        arguments:
            QuranViewArguments(key: key, sura: sura, currentTab: currentTab),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNoInternetView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.noInternetView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithQuranView({
    _i7.Key? key,
    required _i8.SuraInfo sura,
    required _i9.QuranTabs currentTab,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.quranView,
        arguments:
            QuranViewArguments(key: key, sura: sura, currentTab: currentTab),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
