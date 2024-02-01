import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/home/tabs/quran/quran_tab_viewmodel.dart';
import 'package:dini_atlas/ui/views/home/tabs/quran/widgets/quran_header_card.dart';
import 'package:dini_atlas/ui/views/home/tabs/quran/widgets/quran_surah_list.dart';
import 'package:dini_atlas/ui/views/home/tabs/quran/widgets/quran_tab_buttons.dart';
import 'package:dini_atlas/ui/widgets/no_internet_widget.dart';
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
      child: StreamBuilder<ConnectivityResult>(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != ConnectivityResult.none) {
                return Column(
                  children: [
                    // Son okunan sure bilgisi
                    const QuranHeaderCard(),
                    // Sure listesi filtreleme butonları
                    QuranTabButtons(
                        currentIndex: viewModel.currentIndex,
                        onIndexChanged: viewModel.setIndex),
                    verticalSpaceMedium,
                    viewModel.isBusy
                        ? const CircularProgressIndicator()
                        : viewModel.hasError
                            ? Center(child: Text(viewModel.modelError))
                            : QuranSurahList(
                                sura: viewModel.suraList!,
                                currentIndex: viewModel.currentIndex,
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
