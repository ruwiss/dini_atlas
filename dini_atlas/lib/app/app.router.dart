// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dini_atlas/models/favourite.dart' as _i13;
import 'package:dini_atlas/models/quran/sura_info.dart' as _i11;
import 'package:dini_atlas/ui/views/compass/compass_view.dart' as _i8;
import 'package:dini_atlas/ui/views/favourites/favourites_view.dart' as _i6;
import 'package:dini_atlas/ui/views/home/home_view.dart' as _i2;
import 'package:dini_atlas/ui/views/home/tabs/quran/quran_tab_viewmodel.dart'
    as _i12;
import 'package:dini_atlas/ui/views/no_internet/no_internet_view.dart' as _i4;
import 'package:dini_atlas/ui/views/quran/quran_view.dart' as _i5;
import 'package:dini_atlas/ui/views/startup/startup_view.dart' as _i3;
import 'package:dini_atlas/ui/views/traceable_quran/traceable_quran_view.dart'
    as _i7;
import 'package:flutter/foundation.dart' as _i10;
import 'package:flutter/material.dart' as _i9;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i14;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const noInternetView = '/no-internet-view';

  static const quranView = '/quran-view';

  static const favouritesView = '/favourites-view';

  static const traceableQuranView = '/traceable-quran-view';

  static const compassView = '/compass-view';

  static const all = <String>{
    homeView,
    startupView,
    noInternetView,
    quranView,
    favouritesView,
    traceableQuranView,
    compassView,
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
    _i1.RouteDef(
      Routes.favouritesView,
      page: _i6.FavouritesView,
    ),
    _i1.RouteDef(
      Routes.traceableQuranView,
      page: _i7.TraceableQuranView,
    ),
    _i1.RouteDef(
      Routes.compassView,
      page: _i8.CompassView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.NoInternetView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.NoInternetView(),
        settings: data,
      );
    },
    _i5.QuranView: (data) {
      final args = data.getArgs<QuranViewArguments>(nullOk: false);
      return _i9.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => _i5.QuranView(
            key: args.key, sura: args.sura, currentTab: args.currentTab),
        settings: data,
        transitionsBuilder:
            data.transition ?? _i1.TransitionsBuilders.slideLeftWithFade,
      );
    },
    _i6.FavouritesView: (data) {
      final args = data.getArgs<FavouritesViewArguments>(
        orElse: () => const FavouritesViewArguments(),
      );
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i6.FavouritesView(key: args.key, favourite: args.favourite),
        settings: data,
      );
    },
    _i7.TraceableQuranView: (data) {
      final args = data.getArgs<TraceableQuranViewArguments>(nullOk: false);
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i7.TraceableQuranView(key: args.key, sura: args.sura),
        settings: data,
      );
    },
    _i8.CompassView: (data) {
      final args = data.getArgs<CompassViewArguments>(
        orElse: () => const CompassViewArguments(),
      );
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => _i8.CompassView(key: args.key),
        settings: data,
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

  final _i10.Key? key;

  final _i11.SuraInfo sura;

  final _i12.QuranTabs currentTab;

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

class FavouritesViewArguments {
  const FavouritesViewArguments({
    this.key,
    this.favourite,
  });

  final _i10.Key? key;

  final _i13.Favourite? favourite;

  @override
  String toString() {
    return '{"key": "$key", "favourite": "$favourite"}';
  }

  @override
  bool operator ==(covariant FavouritesViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.favourite == favourite;
  }

  @override
  int get hashCode {
    return key.hashCode ^ favourite.hashCode;
  }
}

class TraceableQuranViewArguments {
  const TraceableQuranViewArguments({
    this.key,
    required this.sura,
  });

  final _i10.Key? key;

  final _i11.SuraInfo sura;

  @override
  String toString() {
    return '{"key": "$key", "sura": "$sura"}';
  }

  @override
  bool operator ==(covariant TraceableQuranViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.sura == sura;
  }

  @override
  int get hashCode {
    return key.hashCode ^ sura.hashCode;
  }
}

class CompassViewArguments {
  const CompassViewArguments({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant CompassViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

extension NavigatorStateExtension on _i14.NavigationService {
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
    _i10.Key? key,
    required _i11.SuraInfo sura,
    required _i12.QuranTabs currentTab,
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

  Future<dynamic> navigateToFavouritesView({
    _i10.Key? key,
    _i13.Favourite? favourite,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.favouritesView,
        arguments: FavouritesViewArguments(key: key, favourite: favourite),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTraceableQuranView({
    _i10.Key? key,
    required _i11.SuraInfo sura,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.traceableQuranView,
        arguments: TraceableQuranViewArguments(key: key, sura: sura),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCompassView({
    _i10.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.compassView,
        arguments: CompassViewArguments(key: key),
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
    _i10.Key? key,
    required _i11.SuraInfo sura,
    required _i12.QuranTabs currentTab,
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

  Future<dynamic> replaceWithFavouritesView({
    _i10.Key? key,
    _i13.Favourite? favourite,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.favouritesView,
        arguments: FavouritesViewArguments(key: key, favourite: favourite),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTraceableQuranView({
    _i10.Key? key,
    required _i11.SuraInfo sura,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.traceableQuranView,
        arguments: TraceableQuranViewArguments(key: key, sura: sura),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCompassView({
    _i10.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.compassView,
        arguments: CompassViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
