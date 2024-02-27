import 'package:app_widget/app_widget.dart';
import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/app/app.router.dart';
import 'package:dini_atlas/extensions/datetime_extensions.dart';
import 'package:dini_atlas/extensions/string_extensions.dart';
import 'package:dini_atlas/models/prayer/prayer_shared_p.dart';
import 'package:dini_atlas/models/user_setting.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked_services/stacked_services.dart';

import 'prayer_times_service.dart';

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

  static Future<
      ({
        String difference,
        PrayerSharedPItem prayer,
        bool moreThanOneHour,
        PrayerSharedP prayerTimes
      })?> _calculatePrayerTimes() async {
    final result = await PrayerTimesService.calculateSharedPrefNextPrayerTime();

    if (result == null) return null;

    DateTime prayerTime = result.item.timeValue.parseTime().convertToDateTime();
    if (result.isNextDay) prayerTime = prayerTime.add(const Duration(days: 1));

    final DateTime now = DateTime.now();
    final DateTime nowAsTime = DateTime(0, 0, 0, now.hour, now.minute);

    // Sıradaki namaza ne kadar kaldı hesapla [00:00]
    final difference = prayerTime.differenceToString(nowAsTime,
        withSeconds: false, eksiBir: true);
    final differenceMinutes =
        prayerTime.differenceToStringMinutesForPushNotification(nowAsTime);
    final bool moreThanOneHour = differenceMinutes >= 60;

    return (
      prayer: result.item,
      difference: difference,
      moreThanOneHour: moreThanOneHour,
      prayerTimes: result.prayerTimes,
    );
  }

  static void configureBigWidget(int widgetId, {bool isUpdate = false}) async {
    final result = await _calculatePrayerTimes();
    if (result == null) return;

    PrayerSharedPItem getType(PrayerType type) =>
        result.prayerTimes.items.singleWhere((e) => e.name == type.text);

    final process = isUpdate
        ? AppWidgetPlugin().updateWidget
        : _appWidgetPlugin.configureWidget;

    process(
      widgetId: widgetId,
      widgetLayout: 'yeni_buyuk_widget',
      textViews: {
        'textView3': result.prayer.name,
        'textView4': result.difference,
        'textView20': result.moreThanOneHour ? 'saat ' : 'dakika',
        'textView21': 'İmsak',
        'textView22': 'Güneş',
        'textView23': 'Öğle',
        'textView24': 'İkindi',
        'textView25': 'Akşam',
        'textView26': 'Yatsı',
        'textView7': getType(PrayerType.imsak).timeValue,
        'textView8': getType(PrayerType.gunes).timeValue,
        'textView9': getType(PrayerType.ogle).timeValue,
        'textView10': getType(PrayerType.ikindi).timeValue,
        'textView11': getType(PrayerType.aksam).timeValue,
        'textView12': getType(PrayerType.yatsi).timeValue,
      },
    );
  }

  static void configureMiniWidget(int widgetId, {bool isUpdate = false}) async {
    final result = await _calculatePrayerTimes();
    if (result == null) return;

    final process = isUpdate
        ? AppWidgetPlugin().updateWidget
        : _appWidgetPlugin.configureWidget;

    process(
      widgetId: widgetId,
      widgetLayout: 'yeni_kucuk_widget',
      textViews: {
        'textView3': result.prayer.name,
        'textView4': result.difference,
        'textView20': result.moreThanOneHour ? 'saat ' : 'dakika',
      },
    );
  }

  static void updateAvailableHomeWidgets() async {
    final bigWidgets = await AppWidgetPlugin()
        .getWidgetIds(androidProviderName: "PrayerWidgetProvider");
    final miniWidgets = await AppWidgetPlugin()
        .getWidgetIds(androidProviderName: "PrayerMiniWidgetProvider");

    for (int id in bigWidgets ?? []) {
      configureBigWidget(id, isUpdate: true);
    }

    for (int id in miniWidgets ?? []) {
      configureMiniWidget(id, isUpdate: true);
    }
  }
}
