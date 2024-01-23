import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
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
            onTap: () {},
          ),
          _dateTimeWidget(),
          _changeTableIconButton(
            icon: Icons.keyboard_arrow_right_rounded,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Column _dateTimeWidget() {
    return Column(
      children: [
        const Text(
          "Cumartesi, Ocak 09",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        verticalSpace(3),
        const Text("27 Cemaziyelahir 1445", style: TextStyle(fontSize: 12))
      ],
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
        child: Column(
          children: [
            _tableItem(text: "İmsak", time: "06:51", isActive: true),
            _tableItem(text: "Güneş", time: "08:22", isActive: false),
            _tableItem(text: "Öğle", time: "13:16", isActive: false),
            _tableItem(text: "İkindi", time: "15:38", isActive: true),
            _tableItem(text: "Akşam", time: "18:00", isActive: true),
            _tableItem(
                text: "Yatsı",
                time: "19:26",
                isActive: true,
                hideDivider: true),
          ],
        ),
      ),
    );
  }

  Padding _tableItem({
    required String text,
    required String time,
    required bool isActive,
    bool hideDivider = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 4),
      child: Column(
        children: [
          Row(
            children: [
              Text(text),
              const Spacer(),
              Text(
                time,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              horizontalSpace(30),
              IconButton(
                onPressed: () {},
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
