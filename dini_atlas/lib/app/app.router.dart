// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dini_atlas/models/favourite.dart' as _i25;
import 'package:dini_atlas/models/quran/sura_info.dart' as _i23;
import 'package:dini_atlas/ui/views/about/about_view.dart' as _i18;
import 'package:dini_atlas/ui/views/compass/compass_view.dart' as _i8;
import 'package:dini_atlas/ui/views/dualar/dualar_view.dart' as _i17;
import 'package:dini_atlas/ui/views/esmaul_husna/esmaul_husna_view.dart'
    as _i16;
import 'package:dini_atlas/ui/views/favourites/favourites_view.dart' as _i6;
import 'package:dini_atlas/ui/views/forty_hadiths/forty_hadiths_view.dart'
    as _i12;
import 'package:dini_atlas/ui/views/home/home_view.dart' as _i2;
import 'package:dini_atlas/ui/views/home/tabs/quran/quran_tab_viewmodel.dart'
    as _i24;
import 'package:dini_atlas/ui/views/kaza/kaza_view.dart' as _i9;
import 'package:dini_atlas/ui/views/native_widget/native_widget_view.dart'
    as _i19;
import 'package:dini_atlas/ui/views/near_mosques/near_mosques_view.dart'
    as _i14;
import 'package:dini_atlas/ui/views/no_internet/no_internet_view.dart' as _i4;
import 'package:dini_atlas/ui/views/quran/quran_view.dart' as _i5;
import 'package:dini_atlas/ui/views/radio/radio_view.dart' as _i13;
import 'package:dini_atlas/ui/views/religious_days/religious_days_view.dart'
    as _i11;
import 'package:dini_atlas/ui/views/riyazus_salihin/riyazus_salihin_view.dart'
    as _i15;
import 'package:dini_atlas/ui/views/rosary/rosary_view.dart' as _i10;
import 'package:dini_atlas/ui/views/startup/startup_view.dart' as _i3;
import 'package:dini_atlas/ui/views/traceable_quran/traceable_quran_view.dart'
    as _i7;
import 'package:dini_atlas/ui/views/webview/webview_view.dart' as _i20;
import 'package:flutter/foundation.dart' as _i22;
import 'package:flutter/material.dart' as _i21;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i26;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const noInternetView = '/no-internet-view';

  static const quranView = '/quran-view';

  static const favouritesView = '/favourites-view';

  static const traceableQuranView = '/traceable-quran-view';

  static const compassView = '/compass-view';

  static const kazaView = '/kaza-view';

  static const rosaryView = '/rosary-view';

  static const religiousDaysView = '/religious-days-view';

  static const fortyHadithsView = '/forty-hadiths-view';

  static const radioView = '/radio-view';

  static const nearMosquesView = '/near-mosques-view';

  static const riyazusSalihinView = '/riyazus-salihin-view';

  static const esmaulHusnaView = '/esmaul-husna-view';

  static const dualarView = '/dualar-view';

  static const aboutView = '/about-view';

  static const nativeWidgetView = '/native-widget-view';

  static const webviewView = '/webview-view';

  static const all = <String>{
    homeView,
    startupView,
    noInternetView,
    quranView,
    favouritesView,
    traceableQuranView,
    compassView,
    kazaView,
    rosaryView,
    religiousDaysView,
    fortyHadithsView,
    radioView,
    nearMosquesView,
    riyazusSalihinView,
    esmaulHusnaView,
    dualarView,
    aboutView,
    nativeWidgetView,
    webviewView,
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
    _i1.RouteDef(
      Routes.kazaView,
      page: _i9.KazaView,
    ),
    _i1.RouteDef(
      Routes.rosaryView,
      page: _i10.RosaryView,
    ),
    _i1.RouteDef(
      Routes.religiousDaysView,
      page: _i11.ReligiousDaysView,
    ),
    _i1.RouteDef(
      Routes.fortyHadithsView,
      page: _i12.FortyHadithsView,
    ),
    _i1.RouteDef(
      Routes.radioView,
      page: _i13.RadioView,
    ),
    _i1.RouteDef(
      Routes.nearMosquesView,
      page: _i14.NearMosquesView,
    ),
    _i1.RouteDef(
      Routes.riyazusSalihinView,
      page: _i15.RiyazusSalihinView,
    ),
    _i1.RouteDef(
      Routes.esmaulHusnaView,
      page: _i16.EsmaulHusnaView,
    ),
    _i1.RouteDef(
      Routes.dualarView,
      page: _i17.DualarView,
    ),
    _i1.RouteDef(
      Routes.aboutView,
      page: _i18.AboutView,
    ),
    _i1.RouteDef(
      Routes.nativeWidgetView,
      page: _i19.NativeWidgetView,
    ),
    _i1.RouteDef(
      Routes.webviewView,
      page: _i20.WebviewView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.NoInternetView: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.NoInternetView(),
        settings: data,
      );
    },
    _i5.QuranView: (data) {
      final args = data.getArgs<QuranViewArguments>(nullOk: false);
      return _i21.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => _i5.QuranView(
            key: args.key,
            sura: args.sura,
            currentTab: args.currentTab,
            ayah: args.ayah),
        settings: data,
        transitionsBuilder:
            data.transition ?? _i1.TransitionsBuilders.slideLeftWithFade,
      );
    },
    _i6.FavouritesView: (data) {
      final args = data.getArgs<FavouritesViewArguments>(
        orElse: () => const FavouritesViewArguments(),
      );
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i6.FavouritesView(key: args.key, favourite: args.favourite),
        settings: data,
      );
    },
    _i7.TraceableQuranView: (data) {
      final args = data.getArgs<TraceableQuranViewArguments>(nullOk: false);
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i7.TraceableQuranView(key: args.key, sura: args.sura),
        settings: data,
      );
    },
    _i8.CompassView: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.CompassView(),
        settings: data,
      );
    },
    _i9.KazaView: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.KazaView(),
        settings: data,
      );
    },
    _i10.RosaryView: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.RosaryView(),
        settings: data,
      );
    },
    _i11.ReligiousDaysView: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.ReligiousDaysView(),
        settings: data,
      );
    },
    _i12.FortyHadithsView: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.FortyHadithsView(),
        settings: data,
      );
    },
    _i13.RadioView: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.RadioView(),
        settings: data,
      );
    },
    _i14.NearMosquesView: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.NearMosquesView(),
        settings: data,
      );
    },
    _i15.RiyazusSalihinView: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.RiyazusSalihinView(),
        settings: data,
      );
    },
    _i16.EsmaulHusnaView: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i16.EsmaulHusnaView(),
        settings: data,
      );
    },
    _i17.DualarView: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i17.DualarView(),
        settings: data,
      );
    },
    _i18.AboutView: (data) {
      final args = data.getArgs<AboutViewArguments>(
        orElse: () => const AboutViewArguments(),
      );
      return _i21.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => _i18.AboutView(
            key: args.key, showSubscriptionView: args.showSubscriptionView),
        settings: data,
        transitionsBuilder:
            data.transition ?? _i1.TransitionsBuilders.slideRightWithFade,
      );
    },
    _i19.NativeWidgetView: (data) {
      final args = data.getArgs<NativeWidgetViewArguments>(nullOk: false);
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i19.NativeWidgetView(key: args.key, widgetId: args.widgetId),
        settings: data,
      );
    },
    _i20.WebviewView: (data) {
      final args = data.getArgs<WebviewViewArguments>(nullOk: false);
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => _i20.WebviewView(
            key: args.key, title: args.title, path: args.path, url: args.url),
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
    this.ayah,
  });

  final _i22.Key? key;

  final _i23.SuraInfo sura;

  final _i24.QuranTabs currentTab;

  final int? ayah;

  @override
  String toString() {
    return '{"key": "$key", "sura": "$sura", "currentTab": "$currentTab", "ayah": "$ayah"}';
  }

  @override
  bool operator ==(covariant QuranViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.sura == sura &&
        other.currentTab == currentTab &&
        other.ayah == ayah;
  }

  @override
  int get hashCode {
    return key.hashCode ^ sura.hashCode ^ currentTab.hashCode ^ ayah.hashCode;
  }
}

class FavouritesViewArguments {
  const FavouritesViewArguments({
    this.key,
    this.favourite,
  });

  final _i22.Key? key;

  final _i25.Favourite? favourite;

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

  final _i22.Key? key;

  final _i23.SuraInfo sura;

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

class AboutViewArguments {
  const AboutViewArguments({
    this.key,
    this.showSubscriptionView = false,
  });

  final _i22.Key? key;

  final bool showSubscriptionView;

  @override
  String toString() {
    return '{"key": "$key", "showSubscriptionView": "$showSubscriptionView"}';
  }

  @override
  bool operator ==(covariant AboutViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.showSubscriptionView == showSubscriptionView;
  }

  @override
  int get hashCode {
    return key.hashCode ^ showSubscriptionView.hashCode;
  }
}

class NativeWidgetViewArguments {
  const NativeWidgetViewArguments({
    this.key,
    required this.widgetId,
  });

  final _i22.Key? key;

  final int widgetId;

  @override
  String toString() {
    return '{"key": "$key", "widgetId": "$widgetId"}';
  }

  @override
  bool operator ==(covariant NativeWidgetViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.widgetId == widgetId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ widgetId.hashCode;
  }
}

class WebviewViewArguments {
  const WebviewViewArguments({
    this.key,
    required this.title,
    this.path,
    this.url,
  });

  final _i22.Key? key;

  final String title;

  final String? path;

  final String? url;

  @override
  String toString() {
    return '{"key": "$key", "title": "$title", "path": "$path", "url": "$url"}';
  }

  @override
  bool operator ==(covariant WebviewViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.title == title &&
        other.path == path &&
        other.url == url;
  }

  @override
  int get hashCode {
    return key.hashCode ^ title.hashCode ^ path.hashCode ^ url.hashCode;
  }
}

extension NavigatorStateExtension on _i26.NavigationService {
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
    _i22.Key? key,
    required _i23.SuraInfo sura,
    required _i24.QuranTabs currentTab,
    int? ayah,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.quranView,
        arguments: QuranViewArguments(
            key: key, sura: sura, currentTab: currentTab, ayah: ayah),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToFavouritesView({
    _i22.Key? key,
    _i25.Favourite? favourite,
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
    _i22.Key? key,
    required _i23.SuraInfo sura,
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

  Future<dynamic> navigateToCompassView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.compassView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToKazaView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.kazaView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRosaryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.rosaryView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToReligiousDaysView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.religiousDaysView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToFortyHadithsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.fortyHadithsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRadioView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.radioView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNearMosquesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.nearMosquesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRiyazusSalihinView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.riyazusSalihinView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEsmaulHusnaView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.esmaulHusnaView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDualarView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.dualarView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAboutView({
    _i22.Key? key,
    bool showSubscriptionView = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.aboutView,
        arguments: AboutViewArguments(
            key: key, showSubscriptionView: showSubscriptionView),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNativeWidgetView({
    _i22.Key? key,
    required int widgetId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.nativeWidgetView,
        arguments: NativeWidgetViewArguments(key: key, widgetId: widgetId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWebviewView({
    _i22.Key? key,
    required String title,
    String? path,
    String? url,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.webviewView,
        arguments:
            WebviewViewArguments(key: key, title: title, path: path, url: url),
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
    _i22.Key? key,
    required _i23.SuraInfo sura,
    required _i24.QuranTabs currentTab,
    int? ayah,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.quranView,
        arguments: QuranViewArguments(
            key: key, sura: sura, currentTab: currentTab, ayah: ayah),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithFavouritesView({
    _i22.Key? key,
    _i25.Favourite? favourite,
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
    _i22.Key? key,
    required _i23.SuraInfo sura,
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

  Future<dynamic> replaceWithCompassView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.compassView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithKazaView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.kazaView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRosaryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.rosaryView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithReligiousDaysView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.religiousDaysView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithFortyHadithsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.fortyHadithsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRadioView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.radioView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNearMosquesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.nearMosquesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRiyazusSalihinView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.riyazusSalihinView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEsmaulHusnaView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.esmaulHusnaView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDualarView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.dualarView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAboutView({
    _i22.Key? key,
    bool showSubscriptionView = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.aboutView,
        arguments: AboutViewArguments(
            key: key, showSubscriptionView: showSubscriptionView),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNativeWidgetView({
    _i22.Key? key,
    required int widgetId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.nativeWidgetView,
        arguments: NativeWidgetViewArguments(key: key, widgetId: widgetId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithWebviewView({
    _i22.Key? key,
    required String title,
    String? path,
    String? url,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.webviewView,
        arguments:
            WebviewViewArguments(key: key, title: title, path: path, url: url),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
