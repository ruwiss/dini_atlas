import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/rosary/rosary_viewmodel.dart';
import 'package:flutter/material.dart';

class RosaryCounterWidget extends StatelessWidget {
  const RosaryCounterWidget({super.key, required this.viewModel});
  final RosaryViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 34,
        bottom: 24,
        left: 44,
        right: 44,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90),
        color: kcBlueGrayColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${viewModel.count}",
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w300,
              color: kcPrimaryColorDark,
            ),
          ),
          verticalSpaceTiny,
          !viewModel.editMode
              ? Text("${viewModel.limit}", style: _limitCountStyle)
              : SizedBox(
                  width: 40,
                  child: TextFormField(
                    controller: viewModel.limitCountController,
                    keyboardType: const TextInputType.numberWithOptions(),
                    textAlign: TextAlign.center,
                    autofocus: true,
                    style: _limitCountStyle,
                    maxLength: 3,
                    onFieldSubmitted: viewModel.changeLimitCount,
                    onChanged: (value) {
                      if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        viewModel.limitCountController.text = "";
                      }
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      hintText: "0",
                      hintStyle: _limitCountStyle,
                      counterText: "",
                    ),
                  ),
                ),
          verticalSpaceMedium,
          // Edit Limit Button
          _editLimitButton()
        ],
      ),
    );
  }

  final TextStyle _limitCountStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  Widget _editLimitButton() {
    return IconButton(
      onPressed: viewModel.toggleEditMode,
      style: IconButton.styleFrom(
          backgroundColor: kcBackgroundColor,
          padding: const EdgeInsets.all(10)),
      icon: Icon(
        viewModel.editMode ? Icons.close : Icons.edit,
        color: kcPrimaryColorDark,
      ),
    );
  }
}
