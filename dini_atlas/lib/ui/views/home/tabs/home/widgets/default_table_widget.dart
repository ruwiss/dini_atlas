import 'package:dini_atlas/extensions/datetime_extensions.dart';
import 'package:dini_atlas/models/prayer/prayer_time.dart';
import 'package:dini_atlas/models/user_setting.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../home_tab_viewmodel.dart';

class DefaultTableWidget extends StatelessWidget {
  final HomeTabViewModel viewModel;
  const DefaultTableWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final String? eidPrayer = viewModel.ifTodayEidPrayerTimeGetTime();
    return Column(
      children: [
        _tableHeader(),
        // Eğer bugün bayram ise namaz saatini göster
        if (eidPrayer != null) ...[
          verticalSpace(20),
          Text(
            eidPrayer,
            style: const TextStyle(fontSize: 14, color: kcPrimaryColor),
          )
        ],
        verticalSpace(20),
        Expanded(child: SingleChildScrollView(child: _tableBody(context))),
        verticalSpaceSmall,
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
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 16),
      decoration: BoxDecoration(
        color: kcGrayColorLight,
        borderRadius: borderRadiusMedium,
      ),
      child: Builder(
        key: ValueKey(viewModel.selectedPrayerTime),
        builder: (context) {
          if (viewModel.selectedPrayerTime == null) return const SizedBox();
          return Column(
            children: [
              _tableItem(prayerType: PrayerType.imsak),
              _tableItem(prayerType: PrayerType.gunes),
              _tableItem(prayerType: PrayerType.ogle),
              _tableItem(prayerType: PrayerType.ikindi),
              _tableItem(prayerType: PrayerType.aksam),
              _tableItem(prayerType: PrayerType.yatsi, hideDivider: true),
            ],
          );
        },
      ),
    );
  }

  Widget _tableItem({
    required PrayerType prayerType,
    bool hideDivider = false,
  }) {
    final PrayerTime prayerTime = viewModel.tablePrayerTime;
    final bool isCurrentPrayer = viewModel.isCurrentPrayerTime(prayerTime);
    late bool isCurrent;
    // sonraki vakit mi?
    isCurrent = isCurrentPrayer && viewModel.currentPrayerType == prayerType;
    if (viewModel.nextTimeIsAfterDay!) {
      isCurrent = prayerType == PrayerType.all;
    }
    final (PrayerType, String) values = switch (prayerType) {
      PrayerType.imsak => (PrayerType.imsak, prayerTime.imsak),
      PrayerType.gunes => (PrayerType.gunes, prayerTime.gunes),
      PrayerType.ogle => (PrayerType.ogle, prayerTime.ogle),
      PrayerType.ikindi => (PrayerType.ikindi, prayerTime.ikindi),
      PrayerType.aksam => (PrayerType.aksam, prayerTime.aksam),
      PrayerType.yatsi => (PrayerType.yatsi, prayerTime.yatsi),
      PrayerType.all => (PrayerType.all, "-"),
    };

    final bool isActive = viewModel.isNotiActiveForPrayer(prayerType);
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 4),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                values.$1.text,
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
