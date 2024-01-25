import 'package:dini_atlas/extensions/datetime_extensions.dart';
import 'package:dini_atlas/models/prayer/prayer_time.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/home/tabs/home/home_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../home_tab_viewmodel.dart';

class TableWidget extends StatelessWidget {
  final HomeTabViewModel viewModel;
  const TableWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _tableHeader(),
        verticalSpace(20),
        _tableBody(context),
      ],
    );
  }

  Container _tableHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 11),
      decoration: BoxDecoration(
        color: kcBlueGrayColor,
        borderRadius: borderRadiusMedium,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _changeTableIconButton(
            icon: Icons.keyboard_arrow_left_rounded,
            onTap: () => viewModel.changePrayerTimeIndex(decrement: true),
          ),
          _dateTimeWidget(),
          _changeTableIconButton(
            icon: Icons.keyboard_arrow_right_rounded,
            onTap: () => viewModel.changePrayerTimeIndex(increment: true),
          ),
        ],
      ),
    );
  }

  Widget _dateTimeWidget() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 600),
      child: viewModel.selectedPrayerTime == null
          ? const SizedBox()
          : Builder(
              builder: (context) {
                final PrayerTime prayerTime = viewModel.tablePrayerTime;
                return Column(
                  key: const ValueKey("THeader"),
                  children: [
                    Text(
                      prayerTime.miladiTarihUzunIso8601.formatAsWeekMonthDay(),
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    verticalSpace(3),
                    Text(
                      prayerTime.hicriTarihUzun,
                      style: const TextStyle(fontSize: 12),
                    )
                  ],
                );
              },
            ),
    );
  }

  IconButton _changeTableIconButton({VoidCallback? onTap, IconData? icon}) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        icon,
        color: kcGrayColor,
        size: 28,
      ),
    );
  }

  Container _tableBody(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: screenHeight(context) * 0.49),
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 16),
      decoration: BoxDecoration(
        color: kcGrayColorLight,
        borderRadius: borderRadiusMedium,
      ),
      child: SingleChildScrollView(
        child: Builder(
          key: ValueKey(viewModel.selectedPrayerTime),
          builder: (context) {
            if (viewModel.selectedPrayerTime == null) {
              return const SizedBox();
            }
            return Column(
              children: [
                _tableItem(
                  prayerType: PrayerType.imsak,
                  isActive: true,
                ),
                _tableItem(
                  prayerType: PrayerType.gunes,
                  isActive: false,
                ),
                _tableItem(
                  prayerType: PrayerType.ogle,
                  isActive: false,
                ),
                _tableItem(
                  prayerType: PrayerType.ikindi,
                  isActive: true,
                ),
                _tableItem(
                  prayerType: PrayerType.aksam,
                  isActive: true,
                ),
                _tableItem(
                  prayerType: PrayerType.yatsi,
                  isActive: false,
                  hideDivider: true,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _tableItem({
    required PrayerType prayerType,
    required bool isActive,
    bool hideDivider = false,
  }) {
    final PrayerTime prayerTime = viewModel.tablePrayerTime;
    final isCurrentPrayer = viewModel.isCurrentPrayerTime(prayerTime);
    late bool isCurrent;
    // sonraki vakit mi?
    isCurrent = isCurrentPrayer && viewModel.currentPrayerType == prayerType;
    if (viewModel.nextTimeIsAfterDay!) {
      isCurrent = prayerType == PrayerType.none;
    }
    final (String, String) values = switch (prayerType) {
      PrayerType.imsak => ("İmsak", prayerTime.imsak),
      PrayerType.gunes => ("Güneş", prayerTime.gunes),
      PrayerType.ogle => ("Öğle", prayerTime.ogle),
      PrayerType.ikindi => ("İkindi", prayerTime.ikindi),
      PrayerType.aksam => ("Akşam", prayerTime.aksam),
      PrayerType.yatsi => ("Yatsı", prayerTime.yatsi),
      PrayerType.none => ("-", "-"),
    };
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 4),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                values.$1,
                style: !isCurrent
                    ? null
                    : const TextStyle(
                        fontWeight: FontWeight.w600, color: kcPrimaryColor),
              ),
              const Spacer(),
              Text(
                values.$2,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              horizontalSpace(30),
              IconButton(
                onPressed: () =>
                    viewModel.showNotificationSettingsDialog(values.$1),
                icon: SvgPicture.asset(
                  isActive ? kiNotificationEnabled : kiNotificationDisabled,
                ),
              ),
            ],
          ),
          if (!hideDivider) const Divider(),
        ],
      ),
    );
  }
}
