import 'package:dini_atlas/models/content_type.dart';
import 'package:dini_atlas/models/quran/ayah_list.dart';
import 'package:dini_atlas/models/quran/sura_info.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/home/tabs/quran/quran_tab_viewmodel.dart';
import 'package:dini_atlas/ui/views/quran/widgets/quran_header.dart';
import 'package:dini_atlas/ui/widgets/appbar.dart';
import 'package:dini_atlas/ui/widgets/banner_ad_widget.dart';
import 'package:dini_atlas/ui/widgets/content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import 'quran_viewmodel.dart';

class QuranView extends StackedView<QuranViewModel> {
  const QuranView({
    super.key,
    required this.sura,
    required this.currentTab,
    // istediğimiz ayetten başlasın
    this.ayah,
  });
  final SuraInfo sura;
  final QuranTabs currentTab;
  final int? ayah;

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
          ),
          IconButton(
            onPressed: () => viewModel.onHashtagButtonTap(context),
            icon: const Icon(Icons.numbers, color: kcPrimaryColorLight),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: viewModel.hasError
            ? Text("${viewModel.modelError}")
            : viewModel.isBusy || viewModel.ayahList == null
                ? Center(child: _loadingWidget())
                : _quranView(context, viewModel),
      ),
    );
  }

  Widget _quranView(BuildContext context, QuranViewModel viewModel) {
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
          final AyahModel ayahModel = ayahList.ayetler[index];
          final suraSetting = viewModel.userSettings.suraSetting;
          return Column(
            key: GlobalObjectKey(ayahModel.ayet),
            children: [
              if (index == 0)
                QuranHeader(
                  sura: ayahList.sure,
                  onInfoTap: viewModel.showSuraInfo,
                ),
              if (index == 0) BannerAdWidget(bannerAd: viewModel.bannerAd),
              ContentWidget(
                increaseFontSize:
                    viewModel.userSettings.increaseAyahFontSize.toDouble(),
                type: ContentTypes.ayahType(),
                number: ayahModel.ayet,
                text1: suraSetting.showArabicText ? ayahModel.textAr : null,
                text2:
                    suraSetting.showTurkishText ? ayahModel.textOkunus : null,
                text3: suraSetting.showMeaningText ? ayahModel.textMeal : null,
                words: suraSetting.showMeaningText
                    ? ayahModel.textKelimeler
                    : null,
                onPlay: () => viewModel.playSura(ayahModel),
                onPause: () => viewModel.pauseAudioPlayer(),
                isPlaying: viewModel.isPlayingAyahId(ayahModel.ayet),
                isPlayerLoading: viewModel.busy(viewModel.playingAyahId) &&
                    viewModel.playingAyahId == ayahModel.ayet,
                isSaved: viewModel.isInFavourites(ayahModel.ayet),
                onBookmarkTap: () => viewModel.onBookmarkTap(ayahModel),
                onSaveLastAyah: () => viewModel.saveAyahAsLastRead(ayahModel),
                isSavedLastAyah: viewModel.isLastReadAyah(ayahModel),
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
    viewModel.init(sura: sura, ayah: ayah);
  }
}
