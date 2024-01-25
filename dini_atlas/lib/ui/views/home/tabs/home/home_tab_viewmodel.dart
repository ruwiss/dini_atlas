import 'package:dini_atlas/app/app.dialogs.dart';
import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/extensions/datetime_extensions.dart';
import 'package:dini_atlas/models/location_api/city.dart';
import 'package:dini_atlas/models/prayer/prayer_time.dart';
import 'package:dini_atlas/services/local/prayer_times_service.dart';
import 'package:dini_atlas/services/local/user_settings_service.dart';
import 'package:dini_atlas/services/remote/fetch_times_service.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/dialogs/settings/base_dialog_items.dart';
import 'package:dini_atlas/ui/views/home/tabs/home/home_service.dart';
import 'package:dini_atlas/ui/views/home/tabs/home/widgets/selectable_button.dart';
import 'package:dini_atlas/ui/views/home/tabs/home/widgets/selectable_tile.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

enum SettingTimeSelection { dk5, dk15, dk30 }

class HomeTabViewModel extends ReactiveViewModel {
  final HomeService _homeService = HomeService();
  final _prayerTimesService = locator<PrayerTimesService>();
  final _fetchTimesService = locator<FetchTimesService>();
  final _userSettingsService = locator<UserSettingsService>();

  String? currentMoonPhaseImage;
  City? userCity;
  int? selectedPrayerTime;

  List<PrayerTime>? get _prayerTimeList =>
      _homeService.prayerTimes?.prayerTimes;
  bool? get nextTimeIsAfterDay => _homeService.nextTimeIsAfterDay;
  PrayerType get currentPrayerType => _homeService.currentPrayerType;

  @override
  List<ListenableServiceMixin> get listenableServices => [_homeService];

  Future<void> init() async {
    // Ana servisteki değişiklikleri dinle
    _homeService.listen();

    // Namaz vakitlerini getir
    await _getPrayerTimes();

    // Gelen namaz vakitlerini hazırla
    _homeService.calculatePrayerTime();

    // Ayın seklini getir
    _getCurrentMoonPhaseImage();

    // Kullanıcı şehrini getir
    getUserCity();

    // Tablo için vakitleri getir
    changePrayerTimeIndex();
  }

  Future<void> _getPrayerTimes() async {
    final result = await _prayerTimesService.getPrayerTimes();

    await result.fold(
      (times) async {
        _homeService.prayerTimes = times;
        notifyListeners();
      },
      (ifNotUpToDate) async {
        // Asenkron işlem tamamlanana kadar bekleyeceğiz
        _homeService.prayerTimes = await _fetchTimesService.fetchTimes();
        notifyListeners();
      },
    );

    notifyListeners();
  }

  void _getCurrentMoonPhaseImage() {
    currentMoonPhaseImage =
        _homeService.getTimesByDay(DateTime.now()).ayinSekliUrl.split("/").last;
    notifyListeners();
  }

  void getUserCity() async {
    final userSettings = await _userSettingsService.getUserSettings();
    userCity = userSettings?.city;
    notifyListeners();
  }

  PrayerTime get tablePrayerTime => _prayerTimeList![selectedPrayerTime!];

  void changePrayerTimeIndex({bool? increment, bool? decrement}) {
    // Eğer bir değişim yoksa, o zaman sadece bugünün namazı sırasını getir
    if (increment == null && decrement == null) {
      final DateTime datetime = DateTime.now();

      // Sıradaki vakit namazları getir (tablo için)
      selectedPrayerTime = _prayerTimeList
          ?.indexWhere((e) => e.miladiTarihUzunIso8601.isEqualTo(datetime));
    } else {
      // Tabloda önceki güne gidilince
      if (increment != null) selectedPrayerTime = selectedPrayerTime! + 1;
      // Tabloda sonraki güne gidilirse
      if (decrement != null) selectedPrayerTime = selectedPrayerTime! - 1;

      // Eğer tabloda gidilen gün mevcut listede yoksa başa dön
      if (selectedPrayerTime! >= _prayerTimeList!.length) {
        selectedPrayerTime = 0;
      } else if (selectedPrayerTime!.isNegative) {
        // Eğer tabloda gidilen günden daha öncesi yoksa sona git
        selectedPrayerTime = _prayerTimeList!.length - 1;
      }
    }
    notifyListeners();
  }

  bool isCurrentPrayerTime(PrayerTime prayerTime) =>
      prayerTime.miladiTarihUzunIso8601.isEqualTo(DateTime.now());

  void showNotificationSettingsDialog(String title) {
    SettingTimeSelection timeSelection = SettingTimeSelection.dk15;
    int soundSelection = 0;
    final dialogService = locator<DialogService>();
    dialogService.showCustomDialog(
      variant: DialogType.settings,
      title: title,
      data: [
        const BaseHomeDialogItem1(
          title: "Sesli Uyarı",
          svgIcon: kiEar,
        ),
        verticalSpaceMedium,
        BaseHomeDialogItem1(
          title: "Önceden Uyar",
          svgIcon: kiEar,
          bottomWidget: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: StatefulBuilder(
              builder: (context, setState) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: SettingTimeSelection.values
                      .map(
                        (e) => SelectableSettingButton(
                          text: switch (e) {
                            SettingTimeSelection.dk5 => "5 dk",
                            SettingTimeSelection.dk15 => "15 dk",
                            SettingTimeSelection.dk30 => "30 dk",
                          },
                          selected: e == timeSelection,
                          onTap: (_) => setState(() => timeSelection = e),
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ),
        ),
        verticalSpaceSmall,
        StatefulBuilder(
          builder: (context, setState) {
            return BaseHomeDialogItem1(
              title: "Uyarı Sesleri",
              svgIcon: kiEar,
              bottomWidget: Column(
                children: List.generate(
                  3,
                  (index) => SettingsSelectableTile(
                    text: "Örnek Ses $index",
                    selected: soundSelection == index,
                    onTap: (_) => setState(() => soundSelection = index),
                  ),
                ),
              ),
            );
          },
        ),
        verticalSpaceSmall,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
              onPressed: () {},
              color: kcGrayColorLightSoft,
              child: const Text(
                "Tümüne Uygula",
                style: TextStyle(fontSize: 14, color: kcPrimaryColorDark),
              ),
            ),
            MaterialButton(
              onPressed: () {},
              color: kcPurpleColorLight,
              child: const Text(
                "Kaydet",
                style: TextStyle(fontSize: 14, color: kcPrimaryColorDark),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
