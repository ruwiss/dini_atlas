import 'package:dini_atlas/extensions/datetime_extensions.dart';
import 'package:dini_atlas/models/prayer/prayer_time.dart';
import 'package:dini_atlas/ui/common/constants/app_colors.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/home/tabs/home/home_tab_viewmodel.dart';
import 'package:flutter/material.dart';

class DetailedTableWidget extends StatelessWidget {
  const DetailedTableWidget({super.key, required this.viewModel});
  final HomeTabViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          verticalSpaceSmall,
          _tableWidget(),
        ],
      ),
    );
  }

  Widget _tableWidget() {
    final items = viewModel.weeklyPrayerTimes;
    if (items.isEmpty) {
      return const SizedBox();
    } else {
      return Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          _headerCells(),
          ...List.generate(
            items.length,
            (index) => _timeCells(items[index]),
          ),
        ],
      );
    }
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

  TableRow _timeCells(PrayerTime item) {
    return TableRow(
      children: [
        _tableCell(
          item.miladiTarihUzunIso8601.shortDayName(),
          bold: true,
          alignLeft: true,
        ),
        _tableCell(item.imsak), // İmsak
        _tableCell(item.gunes), // Güneş
        _tableCell(item.ogle), // Öğle
        _tableCell(item.ikindi), // İkindi
        _tableCell(item.aksam), // Akşam
        _tableCell(item.yatsi), // Yatsı
      ],
    );
  }

  Widget _tableCell(String title, {bool bold = false, bool alignLeft = false}) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Text(
          title,
          textAlign: alignLeft ? null : TextAlign.center,
          style: bold ? _cellTextStyleBold : _cellTextStyle,
        ),
      ),
    );
  }
}
