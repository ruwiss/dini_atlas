import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/rosary/rosary_viewmodel.dart';
import 'package:dini_atlas/ui/views/rosary/widgets/action_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RosarySettingButtons extends StatelessWidget {
  const RosarySettingButtons({super.key, required this.viewModel});
  final RosaryViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          // Ses Ayarı
          RosaryActionIconButton(
            icon: SvgPicture.asset(
              kiSound,
              colorFilter: viewModel.sound
                  ? null
                  : const ColorFilter.mode(kcGrayColor, BlendMode.srcIn),
            ),
            onTap: viewModel.changeSound,
          ),
          verticalSpaceSmall,
          // Titreşim ayarı
          RosaryActionIconButton(
            icon: SvgPicture.asset(
              kiVibrate,
              colorFilter: viewModel.vibrate
                  ? null
                  : const ColorFilter.mode(kcGrayColor, BlendMode.srcIn),
            ),
            onTap: viewModel.changeVibrate,
          ),
        ],
      ),
    );
  }
}
