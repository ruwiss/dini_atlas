import 'package:audioplayers/audioplayers.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/views/traceable_quran/traceable_quran_viewmodel.dart';
import 'package:dini_atlas/ui/widgets/bottom_nav_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TraceableQuranAudioWidget extends StatelessWidget {
  const TraceableQuranAudioWidget({super.key, required this.viewModel});
  final TraceableQuranViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BottomNavContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: viewModel.previousAudio,
              icon: SvgPicture.asset(kiPreviousDark),
            ),
            viewModel.currentPlayerState == PlayerState.paused
                ? IconButton(
                    onPressed: viewModel.playAudio,
                    icon: SvgPicture.asset(kiPlayDark),
                  )
                : IconButton(
                    onPressed: viewModel.pauseAudio,
                    icon: SvgPicture.asset(kiPauseDark),
                  ),
            IconButton(
              onPressed: viewModel.forwardAudio,
              icon: SvgPicture.asset(kiForwardDark),
            ),
          ],
        ),
      ),
    );
  }
}
