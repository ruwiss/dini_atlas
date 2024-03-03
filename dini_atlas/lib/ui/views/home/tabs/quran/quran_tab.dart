import 'package:dini_atlas/ui/views/home/tabs/quran/quran_tab_viewmodel.dart';
import 'package:dini_atlas/ui/views/home/tabs/quran/widgets/quran_header_card.dart';
import 'package:dini_atlas/ui/views/home/tabs/quran/widgets/quran_surah_list.dart';
import 'package:dini_atlas/ui/views/home/tabs/quran/widgets/quran_tab_buttons.dart';
import 'package:dini_atlas/ui/widgets/banner_ad_widget.dart';
import 'package:flutter/material.dart';
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
      child: viewModel.isBusy
          ? const CircularProgressIndicator()
          : Column(
              children: [
                // Son okunan sure bilgisi
                QuranSuraHeader(
                  lastReadAyah: viewModel.lastReadAyah,
                  visible: viewModel.headerVisible,
                  onTap: viewModel.onHeaderTap,
                ),
                // Sure listesi filtreleme butonları
                QuranTabButtons(
                  quranTab: viewModel.currentTab,
                  onIndexChanged: (id) {
                    viewModel.setIndex(id);
                    viewModel.scrollTop();
                  },
                ),
                BannerAdWidget(
                  bannerAd: viewModel.bannerAd,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                viewModel.hasError
                    ? Center(child: Text(viewModel.modelError))
                    : QuranSurahList(
                        viewModel: viewModel,
                        scrollController: viewModel.scrollController,
                      ),
              ],
            ),
    );
  }

  @override
  QuranTabViewModel viewModelBuilder(BuildContext context) =>
      QuranTabViewModel();

  @override
  void onViewModelReady(QuranTabViewModel viewModel) {
    viewModel.init();
  }
}
