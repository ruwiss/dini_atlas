import 'package:dini_atlas/models/daily_content.dart';
import 'package:dini_atlas/ui/common/constants/app_colors.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/home/tabs/home/home_tab_viewmodel.dart';
import 'package:flutter/material.dart';

class DailyContentsWidget extends StatelessWidget {
  const DailyContentsWidget({super.key, required this.viewModel});
  final HomeTabViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final contents = viewModel.dailContents;
    if (contents == null) {
      return const SizedBox();
    } else {
      return Column(
        children: [
          verticalSpace(20),
          _contentView(contents.ayet),
          _contentView(contents.hadis),
          _contentView(contents.dua),
        ],
      );
    }
  }

  Widget _contentView(DailyContent content) {
    if (content.metin.trim().isEmpty) {
      return const SizedBox();
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        margin: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          borderRadius: borderRadiusMedium,
          color: kcBackgroundColor,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  switch (content.dailyContentType) {
                    DailyContentType.ayet => "Günün Ayeti",
                    DailyContentType.hadis => "Günün Hadisi",
                    DailyContentType.dua => "Günün Duâsı",
                  },
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: kcPrimaryColor,
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: Text(
                    content.kaynak,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            verticalSpaceTiny,
            SelectableText(
              content.metin,
              style: const TextStyle(
                color: kcPrimaryColorDark,
                fontSize: 13,
              ),
            ),
          ],
        ),
      );
    }
  }
}
