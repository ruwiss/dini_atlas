import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/rosary/rosary_viewmodel.dart';
import 'package:flutter/material.dart';

class RosaryCountSetWidget extends StatelessWidget {
  const RosaryCountSetWidget({super.key, required this.viewModel});
  final RosaryViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "SET",
            style: TextStyle(fontSize: 13, color: kcPrimaryColor),
          ),
          verticalSpaceTiny,
          CircleAvatar(
            backgroundColor: kcPrimaryColorLight,
            radius: 16,
            child: Text("${viewModel.set}"),
          ),
        ],
      ),
    );
  }
}
