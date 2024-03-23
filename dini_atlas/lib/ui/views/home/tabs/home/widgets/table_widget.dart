import 'package:dini_atlas/extensions/datetime_extensions.dart';
import 'package:dini_atlas/models/prayer/prayer_time.dart';
import 'package:dini_atlas/models/user_setting.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/home/tabs/home/widgets/daily_contents_widget.dart';
import 'package:dini_atlas/ui/views/home/tabs/home/widgets/detailed_table_widget.dart';
import 'package:dini_atlas/ui/views/home/tabs/home/widgets/story_circle_views.dart';
import 'package:flutter/material.dart';

import '../home_tab_viewmodel.dart';

class TableWidget extends StatelessWidget {
  final HomeTabViewModel viewModel;
  const TableWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 600),
      child: viewModel.selectedPrayerTime == null || viewModel.isBusy
          ? const SizedBox()
          : Builder(
              builder: (context) {
                final String? eidPrayer =
                    viewModel.ifTodayEidPrayerTimeGetTime();
                return Column(
                  children: [
                    _currentDayPrayerTimes(),
                    // Eğer bugün bayram ise namaz saatini göster
                    if (eidPrayer != null) ...[
                      verticalSpace(15),
                      Text(
                        eidPrayer,
                        style: const TextStyle(
                            fontSize: 14, color: kcPrimaryColor),
                      ),
                      verticalSpace(5)
                    ],
                    verticalSpace(10),
                    StoryCircleViews(viewModel: viewModel),
                    DetailedTableWidget(viewModel: viewModel),
                    verticalSpaceSmall,
                    DailyContentsWidget(viewModel: viewModel),
                  ],
                );
              },
            ),
    );
  }

  Container _timeView() {
    final PrayerTime prayerTime = viewModel.tablePrayerTime;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: kcBlueGrayColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
        border: Border.all(
          width: 1,
          color: kcGrayColorMedium,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            prayerTime.miladiTarihUzunIso8601.formatAsWeekMonthDay(),
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          verticalSpace(3),
          Text(
            prayerTime.hicriTarihUzun,
            style: const TextStyle(fontSize: 13),
          )
        ],
      ),
    );
  }

  Widget _currentDayPrayerTimes() {
    final PrayerTime current = viewModel.currentPrayerTime!;
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadiusMedium,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, .2),
              color: kcShadowColor,
              blurRadius: .3,
            ),
          ]),
      child: Column(
        children: [
          _timeView(),
          verticalSpaceSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _currentPrayerItem(time: current.imsak, type: PrayerType.imsak),
              _currentPrayerItem(time: current.gunes, type: PrayerType.gunes),
              _currentPrayerItem(time: current.ogle, type: PrayerType.ogle),
              _currentPrayerItem(time: current.ikindi, type: PrayerType.ikindi),
              _currentPrayerItem(time: current.yatsi, type: PrayerType.yatsi),
            ],
          ),
        ],
      ),
    );
  }

  Column _currentPrayerItem({required String time, required PrayerType type}) {
    final bool isCurrent = viewModel.currentPrayerType == type;
    return Column(
      children: [
        Text(
          type.text,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        Text(
          time,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 1.3,
            fontSize: 15,
            color: isCurrent ? kcPrimaryColorLight : null,
          ),
        ),
      ],
    );
  }
}
