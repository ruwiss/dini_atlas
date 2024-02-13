import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/views/rosary/rosary_viewmodel.dart';
import 'package:dini_atlas/ui/views/rosary/widgets/action_icon_button.dart';
import 'package:flutter/material.dart';

class RosaryCounterActionsWidget extends StatelessWidget {
  const RosaryCounterActionsWidget({super.key, required this.viewModel});
  final RosaryViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        // Arttırma butonu
        _incrementButton(),
        // Reset butonu
        _resetButton(),
      ],
    );
  }

  Widget _resetButton() {
    return RosaryActionIconButton(
      icon: const Icon(Icons.refresh, size: 18, color: kcPrimaryColorDark),
      onTap: viewModel.resetCount,
    );
  }

  Widget _incrementButton() {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 190,
            width: 190,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: kcBackgroundColor,
              boxShadow: [
                BoxShadow(
                  color: kcBlueGrayColor,
                  offset: Offset(0, 0),
                  blurRadius: 10,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 175,
            height: 175,
            child: CircularProgressIndicator(
              value: viewModel.countPercentage,
              strokeWidth: 6,
              backgroundColor: kcBlueGrayColor,
              valueColor:
                  AlwaysStoppedAnimation(kcPurpleColorMedium.withOpacity(.5)),
            ),
          ),
          InkWell(
            onTap: viewModel.incrementCount,
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
            child: Container(
              height: 173,
              width: 173,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: kcBackgroundColor,
              ),
              child: const Text(
                "+",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                  color: kcBlueGrayColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
