import 'package:dini_atlas/ui/common/constants/app_colors.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/home/tabs/quran/quran_tab_viewmodel.dart';
import 'package:dini_atlas/ui/views/home/tabs/quran/widgets/quran_header_card.dart';
import 'package:dini_atlas/ui/views/home/tabs/quran/widgets/quran_surah_list.dart';
import 'package:dini_atlas/ui/views/home/tabs/quran/widgets/quran_tab_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

class QuranTab extends StackedView<QuranTabViewModel> {
  const QuranTab({super.key});

  @override
  Widget builder(
    BuildContext context,
    QuranTabViewModel viewModel,
    Widget? child,
  ) {
    return Center(
      child: Column(
        children: [
          QuranHeaderCard(),
          QuranTabButtons(
              currentIndex: viewModel.currentIndex,
              onIndexChanged: viewModel.setIndex),
          verticalSpaceMedium,
          switch (viewModel.currentIndex) {
            0 => QuranSurahList(),
            1 => const SizedBox(),
            2 => const SizedBox(),
            _ => const SizedBox(),
          }
        ],
      ),
    );
  }

  @override
  QuranTabViewModel viewModelBuilder(BuildContext context) =>
      QuranTabViewModel();

  @override
  void onViewModelReady(QuranTabViewModel viewModel) {
    // init();
  }
}
