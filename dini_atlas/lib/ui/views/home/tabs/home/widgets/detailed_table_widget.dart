import 'package:dini_atlas/extensions/datetime_extensions.dart';
import 'package:dini_atlas/models/prayer/prayer_time.dart';
import 'package:dini_atlas/ui/common/constants/app_colors.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/home/tabs/home/home_tab_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailedTableWidget extends StatelessWidget {
  const DetailedTableWidget({super.key, required this.viewModel});
  final HomeTabViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpaceSmall,
        _tableWidget(),
      ],
    );
  }

  Widget _tableWidget() {
    final items = viewModel.weeklyPrayerTimes;
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        _headerCells(),
        ...List.generate(
          items.length,
          (index) => _timeCells(items[index], isCurrentDay: index == 0),
        ),
      ],
    );
  }

  TextStyle get _cellTextStyle => const TextStyle(
        fontSize: 11.5,
        fontWeight: FontWeight.w500,
      );
  TextStyle get _cellTextStyleBold => TextStyle(
        fontSize: 11.5,
        color: kcPrimaryColorDark.withOpacity(.6),
        fontWeight: FontWeight.w600,
      );
  TextStyle get _cellTextStyleBoldColored => const TextStyle(
        fontSize: 11.5,
        color: kcPrimaryColorLight,
        fontWeight: FontWeight.w600,
      );

  TableRow _headerCells() {
    return TableRow(
      children: [
        const SizedBox(),
        _tableCell("İmsak", bold: true),
        _tableCell("Güneş", bold: true),
        _tableCell("Öğle", bold: true),
        _tableCell("İkindi", bold: true),
        _tableCell("Akşam", bold: true),
        _tableCell("Yatsı", bold: true),
      ],
    );
  }

  TableRow _timeCells(PrayerTime item, {bool isCurrentDay = false}) {
    return TableRow(
      children: [
        _tableCell(
          item.miladiTarihUzunIso8601.shortDayName(),
          bold: true,
          alignLeft: true,
          currentDay: isCurrentDay,
        ),
        _tableCell(item.imsak, currentDay: isCurrentDay), // İmsak
        _tableCell(item.gunes, currentDay: isCurrentDay), // Güneş
        _tableCell(item.ogle, currentDay: isCurrentDay), // Öğle
        _tableCell(item.ikindi, currentDay: isCurrentDay), // İkindi
        _tableCell(item.aksam, currentDay: isCurrentDay), // Akşam
        _tableCell(item.yatsi, currentDay: isCurrentDay), // Yatsı
      ],
    );
  }

  Widget _tableCell(String title,
      {bool bold = false, bool alignLeft = false, bool currentDay = false}) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Text(
          title,
          textAlign: alignLeft ? null : TextAlign.center,
          style: currentDay
              ? _cellTextStyleBoldColored
              : bold
                  ? _cellTextStyleBold
                  : _cellTextStyle,
        ),
      ),
    );
  }
}
