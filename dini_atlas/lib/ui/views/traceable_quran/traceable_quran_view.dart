import 'package:dini_atlas/models/quran/sura_info.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/views/traceable_quran/widgets/traceable_quran.dart';
import 'package:dini_atlas/ui/views/traceable_quran/widgets/traceable_quran_audio_widget.dart';
import 'package:dini_atlas/ui/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import 'traceable_quran_viewmodel.dart';

class TraceableQuranView extends StackedView<TraceableQuranViewModel> {
  const TraceableQuranView({super.key, required this.sura});
  final SuraInfo sura;

  @override
  Widget builder(
    BuildContext context,
    TraceableQuranViewModel viewModel,
    Widget? child,
  ) {
    final bool bismillah = viewModel.currentAyah?.page == null;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBarWidget(
        title: sura.name,
        actions: [
          IconButton(
            onPressed: viewModel.onSettingsTap,
            icon: SvgPicture.asset(kiSettings),
          ),
        ],
      ),
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              alignment: Alignment.bottomCenter,
              children: [
                bismillah
                    ? _bismillahWidget()
                    : TraceableQuranWidget(viewModel: viewModel),
                _zoomInfoView(viewModel),
                AnimatedOpacity(
                  opacity: viewModel.showPlayerView ? 1.0 : 0.0,
                  duration: const Duration(seconds: 1),
                  child: TraceableQuranAudioWidget(viewModel: viewModel),
                )
              ],
            ),
    );
  }

  Widget _zoomInfoView(TraceableQuranViewModel viewModel) {
    bool visible = viewModel.isZoomInfoShown == false;
    return Positioned.fill(
      child: AnimatedSwitcher(
        duration: const Duration(seconds: 2),
        child: visible ? Image.asset(kiZoomInfo) : const SizedBox(),
      ),
    );
  }

  Widget _bismillahWidget() {
    return Center(
      child: SvgPicture.asset(
        kiBismillah,
        colorFilter: const ColorFilter.mode(kcShadowColor, BlendMode.srcIn),
      ),
    );
  }

  @override
  TraceableQuranViewModel viewModelBuilder(BuildContext context) =>
      TraceableQuranViewModel();

  @override
  void onViewModelReady(TraceableQuranViewModel viewModel) {
    viewModel.init(sura);
    super.onViewModelReady(viewModel);
  }
}
