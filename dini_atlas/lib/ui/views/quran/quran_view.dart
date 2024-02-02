import 'package:dini_atlas/models/quran/ayah_list.dart';
import 'package:dini_atlas/models/quran/sura_info.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
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
            onPressed: viewModel.onSettingsTap,
            icon: SvgPicture.asset(kiSettings),
          )
        ],
      ),
      body: viewModel.hasError
          ? Center(child: Text("${viewModel.modelError}"))
          : viewModel.isBusy || viewModel.ayahList == null
              ? const Center(child: CircularProgressIndicator(strokeWidth: 3.3))
              : _quranView(viewModel.ayahList!),
    );
  }

  Container _quranView(AyahList ayahList) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: ayahList.ayetler.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              if (index == 0) QuranHeader(sura: ayahList.sure),
              QuranSuraItem(ayahModel: ayahList.ayetler[index]),
            ],
          );
        },
      ),
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
