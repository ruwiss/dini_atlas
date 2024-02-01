import 'package:dini_atlas/models/quran/sura_model.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuranSurahList extends StatelessWidget {
  const QuranSurahList({
    super.key,
    required this.sura,
    required this.currentIndex,
    this.scrollController
  });
  final List<SuraModel> sura;
  final int currentIndex;
  final ScrollController? scrollController;

  bool get _isSure => currentIndex == 0;
  bool get _isSayfa => currentIndex == 1;
  bool get _isTakipli => currentIndex == 2;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        shrinkWrap: true,
        controller: scrollController,
        itemCount: sura.length,
        itemBuilder: (context, index) {
          final SuraModel item = sura[index];
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

  Widget _surahItem({required SuraModel item, bool hideDivider = false}) {
    return InkWell(
      onTap: () => print(""),
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

  Text _suraTextView(SuraModel item) {
    return Text(_isSayfa ? "Sayfa ${item.page}" : item.nameArabic,
        style: _isSayfa
            ? const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: kcPrimaryColorLight,
              )
            : const TextStyle(
                fontFamily: "Amiri", // Arabic Font
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: kcPrimaryColorLight,
              ));
  }

  Row _suraInfoView(SuraModel item) {
    return Row(
      children: [
        Text(item.location, style: _surahItemSubStyle),
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

  Row _suraNameView(SuraModel item) {
    return Row(
      children: [
        Text(
          item.name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: kcPrimaryColorDark,
          ),
        ),
        if (_isTakipli) // takipli kuran
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

  Stack _suraNumberView(SuraModel item) {
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
