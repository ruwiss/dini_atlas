import 'package:dini_atlas/models/quran/ayah_list.dart';
import 'package:dini_atlas/models/quran/sura_info.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/home/tabs/quran/quran_tab_viewmodel.dart';
import 'package:dini_atlas/ui/views/quran/widgets/quran_header.dart';
import 'package:dini_atlas/ui/views/quran/widgets/quran_sura_item.dart';
import 'package:dini_atlas/ui/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import 'quran_viewmodel.dart';

class QuranView extends StackedView<QuranViewModel> {
  const QuranView({super.key, required this.sura, required this.currentTab});
  final SuraInfo sura;
  final QuranTabs currentTab;

  @override
  Widget builder(
    BuildContext context,
    QuranViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBarWidget(
        title: sura.name,
        actions: [
          IconButton(
            onPressed: viewModel.showSuraInfo,
            icon: const Icon(Icons.info_outline),
          ),
          IconButton(
            onPressed: viewModel.onSettingsTap,
            icon: SvgPicture.asset(kiSettings),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: viewModel.hasError
            ? Text("${viewModel.modelError}")
            : viewModel.isBusy || viewModel.ayahList == null
                ? Center(child: _loadingWidget())
                : _quranView(viewModel),
      ),
    );
  }

  Widget _quranView(QuranViewModel viewModel) {
    final AyahList ayahList = viewModel.ayahList!;
    return NotificationListener<ScrollNotification>(
      onNotification: (info) {
        if (info.metrics.pixels == info.metrics.maxScrollExtent) {
          viewModel.getAyahList(suraId: sura.suraId, loadMore: true);
        }
        return true;
      },
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: ayahList.ayetler.length,
        itemBuilder: (context, index) {
          return Column(
            key: GlobalObjectKey(ayahList.ayetler[index].ayet),
            children: [
              if (index == 0) QuranHeader(sura: ayahList.sure),
              QuranSuraItem(
                viewModel: viewModel,
                ayahModel: ayahList.ayetler[index],
              ),

              // Daha fazla yükleme işlemindeyse indicator ekle
              if (viewModel.loadMoreStatus &&
                  index == ayahList.ayetler.length - 1)
                _loadingWidget(),
            ],
          );
        },
      ),
    );
  }

  Widget _loadingWidget() {
    return const Padding(
      padding: paddingTiny,
      child: CircularProgressIndicator(strokeWidth: 3.3),
    );
  }

  @override
  QuranViewModel viewModelBuilder(BuildContext context) => QuranViewModel();

  @override
  void onViewModelReady(QuranViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.init(sura);
  }
}