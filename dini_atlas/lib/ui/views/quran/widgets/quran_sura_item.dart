import 'dart:ui';

import 'package:dini_atlas/extensions/string_extensions.dart';
import 'package:dini_atlas/models/quran/ayah_list.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuranSuraItem extends StatelessWidget {
  const QuranSuraItem({super.key, required this.ayahModel});
  final AyahModel ayahModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kcGrayColorMedium,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Ayet Numarası
                _ayahNumber(),
                // Action Buttons
                _actionButtons(),
              ],
            ),
          ),
          verticalSpace(24),
          // Arapça Kısım
          _suraArabic(),
          verticalSpace(18),
          // Türkçe Okunuş
          _suraTurkish(),
          verticalSpace(8),
          // Meal Kısmı
          _suraMeal(),
          verticalSpace(18),
          const Divider()
        ],
      ),
    );
  }

  final TextStyle _suraTextStyle = const TextStyle(
    fontSize: 17,
    color: kcPrimaryColorDark,
  );

  Widget _suraMeal() {
    return Text(
      ayahModel.text,
      style: _suraTextStyle,
    );
  }

  Widget _suraTurkish() {
    return Text(
      ayahModel.textOkunus.fixLatinArabicLetters(),
      style: _suraTextStyle.copyWith(fontWeight: FontWeight.w300),
    );
  }

  Widget _suraArabic() {
    const String bismillah = "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ";
    String text = ayahModel.textAr.replaceAll("۞", "");
    if (text.startsWith(bismillah)) text = text.replaceAll(bismillah, "");
    return Text(
      text,
      textAlign: TextAlign.end,
      style: _suraTextStyle.copyWith(
        fontFamily: "Amiri",
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Row _actionButtons() {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: SvgPicture.asset(kiShare)),
        IconButton(onPressed: () {}, icon: SvgPicture.asset(kiPlay)),
        IconButton(
            onPressed: () {}, icon: SvgPicture.asset(kiBookmarkUnchecked))
      ],
    );
  }

  Container _ayahNumber() {
    return Container(
      height: 27,
      width: 27,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: kcPrimaryColorLight,
      ),
      child: Text(
        "${ayahModel.ayet}",
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: kcOnPrimaryColor,
        ),
      ),
    );
  }
}
