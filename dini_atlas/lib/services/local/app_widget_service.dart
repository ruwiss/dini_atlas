import 'package:app_widget/app_widget.dart';
import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/app/app.router.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked_services/stacked_services.dart';

@pragma('vm:entry-point')
void onConfigureWidget(int widgetId) async {
  locator<NavigationService>().replaceWithNativeWidgetView(widgetId: widgetId);
}

@pragma('vm:entry-point')
void onClickWidget(String? payload) async {
  debugPrint(payload);
}

abstract class AppWidgetService {
  static late final AppWidgetPlugin _appWidgetPlugin;

  static void init() {
    _appWidgetPlugin = AppWidgetPlugin(
      androidPackageName: ksAppPackageName,
      onConfigureWidget: onConfigureWidget,
      onClickWidget: onClickWidget,
    );
  }

  static void configureBigWidget(int widgetId) {
    _appWidgetPlugin.configureWidget(
      widgetId: widgetId,
      widgetLayout: 'yeni_buyuk_widget',
      textViews: {
        'textView3': 'Akşam',
        'textView4': '05:34',
        'textView20': 'dakika',
        'textView21': 'İmsak',
        'textView22': 'Güneş',
        'textView23': 'Öğle',
        'textView24': 'İkindi',
        'textView25': 'Akşam',
        'textView26': 'Yatsı',
        'textView7': '00:00',
        'textView8': '00:00',
        'textView9': '00:00',
        'textView10': '00:00',
        'textView11': '00:00',
        'textView12': '00:00',
      },
    );
  }

  static void configureMiniWidget(int widgetId) {
    _appWidgetPlugin.configureWidget(
      widgetId: widgetId,
      widgetLayout: 'yeni_kucuk_widget',
      textViews: {
        'textView3': 'Akşam',
        'textView4': '05:34',
        'textView20': 'dakika',
      },
    );
  }

  static void cancelConfiguration() async {
    await _appWidgetPlugin.cancelConfigureWidget();
  }
}
