import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/rosary/rosary_viewmodel.dart';
import 'package:flutter/material.dart';

class RosaryCountSetWidget extends StatelessWidget {
  const RosaryCountSetWidget({super.key, required this.viewModel});
  final RosaryViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final dark = viewModel.darkMode;
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "TUR",
            style: TextStyle(
              fontSize: 14,
              color: dark ? kcBackgroundColor : kcPrimaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          verticalSpaceTiny,
          CircleAvatar(
            backgroundColor: dark ? kcGrayColorSoft : kcPrimaryColorLight,
            radius: 16,
            child: Text(
              "${viewModel.set}",
              style: TextStyle(color: dark ? kcPrimaryColorDark : null),
            ),
          ),
        ],
      ),
    );
  }
}
