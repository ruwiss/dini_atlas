import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dini_atlas/ui/views/home/tabs/quran/quran_tab_viewmodel.dart';
import 'package:dini_atlas/ui/views/home/tabs/quran/widgets/quran_header_card.dart';
import 'package:dini_atlas/ui/views/home/tabs/quran/widgets/quran_surah_list.dart';
import 'package:dini_atlas/ui/views/home/tabs/quran/widgets/quran_tab_buttons.dart';
import 'package:dini_atlas/ui/widgets/banner_ad_widget.dart';
import 'package:dini_atlas/ui/widgets/no_internet_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class QuranTab extends StackedView<QuranTabViewModel> {
  QuranTab({super.key});

  final _scrollController = ScrollController();
  void _scrollTop() {
    _scrollController.animateTo(
      _scrollController.position.minScrollExtent,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget builder(
    BuildContext context,
    QuranTabViewModel viewModel,
    Widget? child,
  ) {
    return Center(
      child: StreamBuilder<ConnectivityResult>(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshot) {
            if (snapshot.hasData && !viewModel.isBusy) {
              if (snapshot.data != ConnectivityResult.none) {
                return Column(
                  children: [
                    // Son okunan sure bilgisi
                    QuranHeaderCard(lastReadAyah: viewModel.lastReadAyah),
                    // Sure listesi filtreleme butonları
                    QuranTabButtons(
                      quranTab: viewModel.currentTab,
                      onIndexChanged: (id) {
                        viewModel.setIndex(id);
                        _scrollTop();
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
                            scrollController: _scrollController,
                          ),
                  ],
                );
              } else {
                // İnternet bağlantısı yok
                return const NoInternetWidget();
              }
            } else {
              return const CircularProgressIndicator();
            }
          }),
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
