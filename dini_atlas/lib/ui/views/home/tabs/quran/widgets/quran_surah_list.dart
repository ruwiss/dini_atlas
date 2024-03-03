import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/app/app.router.dart';
import 'package:dini_atlas/models/quran/sura_info.dart';
import 'package:dini_atlas/models/user_setting.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/home/tabs/quran/quran_tab_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked_services/stacked_services.dart';

class QuranSurahList extends StatelessWidget {
  const QuranSurahList({
    super.key,
    required this.viewModel,
    this.scrollController,
  });
  final QuranTabViewModel viewModel;
  final ScrollController? scrollController;

  List<SuraInfo> get sura => viewModel.suraList!;
  QuranTabs get currentTab => viewModel.currentTab;
  LastReadAyah get lastReadAyah => viewModel.lastReadAyah;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        shrinkWrap: true,
        primary: false,
        controller: scrollController,
        itemCount: sura.length,
        itemBuilder: (context, index) {
          final SuraInfo item = sura[index];
          return _surahItem(item: item, hideDivider: index == sura.length - 1);
        },
      ),
    );
  }

  final TextStyle _surahItemSubStyle = const TextStyle(
    fontSize: 12,
    color: kcGrayColor,
    fontWeight: FontWeight.w500,
  );

  Widget _surahItem({required SuraInfo item, bool hideDivider = false}) {
    return InkWell(
      highlightColor: Colors.transparent,
      onTap: () {
        viewModel.showInterstitalAl();
        final navService = locator<NavigationService>();
        if (currentTab != QuranTabs.traceable) {
          navService
              .navigateToQuranView(currentTab: currentTab, sura: item)
              .then((_) {
            viewModel.loadInterstitalAd();
            viewModel.showReviewDialog();
            viewModel.getUserSettings();
          });
        } else {
          // Takipli kuran ekranına git
          navService.navigateToTraceableQuranView(sura: item).then((_) {
            viewModel.loadInterstitalAd();
            viewModel.showReviewDialog();
            viewModel.getUserSettings();
          });
        }
      },
      splashFactory: NoSplash.splashFactory,
      child: Column(
        children: [
          verticalSpace(16),
          Row(
            children: [
              _suraNumberView(item), // Sure numarası, çerçeve görünümü
              horizontalSpace(16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _suraNameView(item), // Sure ismi
                  _suraInfoView(item), // Sure bilgisi
                ],
              ),
              const Spacer(),
              // Arapça Sure adı
              _suraTextView(item) // Sure arapça metin / sayfa metni
            ],
          ),
          verticalSpace(14),
          if (!hideDivider) const Divider(),
          if (hideDivider) verticalSpaceMedium,
        ],
      ),
    );
  }

  Text _suraTextView(SuraInfo item) {
    final bool isPage = currentTab == QuranTabs.page;
    return Text(
      isPage ? "Sayfa ${item.page}" : item.nameArabic,
      style: isPage
          ? const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: kcPrimaryColorLight,
            )
          : const TextStyle(
              fontFamily: "Uthman", // Arabic Font
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: kcPrimaryColorLight,
            ),
    );
  }

  Row _suraInfoView(SuraInfo item) {
    return Row(
      children: [
        Text(item.location.toUpperCase().replaceAll("I", "İ"),
            style: _surahItemSubStyle),
        Text(
          " • ",
          style: TextStyle(
            fontSize: 15,
            color: kcGrayColor.withOpacity(.3),
          ),
        ),
        Text("${item.ayahCount} AYET", style: _surahItemSubStyle),
      ],
    );
  }

  Row _suraNameView(SuraInfo item) {
    final bool isLastRead = lastReadAyah.sura == item.name;
    return Row(
      children: [
        Text(
          item.name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isLastRead ? kcPrimaryColorLight : kcPrimaryColorDark,
          ),
        ),
        if (currentTab == QuranTabs.traceable) // takipli kuran
          const Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              "(Takipli)",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
      ],
    );
  }

  Stack _suraNumberView(SuraInfo item) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(kiAyahFrame),
        Text(
          "${item.suraId}",
          style: const TextStyle(
            fontSize: 14,
            color: kcPrimaryColorDark,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
