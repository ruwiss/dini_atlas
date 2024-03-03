import 'package:dini_atlas/models/quran/ayah_list.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/widgets/blend_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuranHeader extends StatelessWidget {
  const QuranHeader({
    super.key,
    required this.sura,
    this.onInfoTap,
  });
  final SuraDetailedInfo sura;
  final VoidCallback? onInfoTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 25),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [_cardView(), _textView(), _quranPicture(), _infoButton()],
      ),
    );
  }

  Positioned _infoButton() {
    return Positioned(
      right: 0,
      bottom: 0,
      child: IconButton(
        onPressed: onInfoTap,
        icon: const Icon(
          Icons.info_outline,
          color: kcBlueGrayColor,
        ),
      ),
    );
  }

  Widget _cardView() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 28),
      height: 255,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [kcPurpleColorMedium, kcPurpleColorDark],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: kcPrimaryColor.withOpacity(.3),
              offset: const Offset(1, 3),
              blurRadius: 10,
            ),
          ]),
    );
  }

  Column _textView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // İsim
        Text(
          sura.isim,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w500,
            color: kcOnPrimaryColor,
          ),
        ),
        verticalSpaceTiny,
        // Cüz Numarası
        Text(
          "${sura.cuz}. Cüz",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: kcOnPrimaryColor,
          ),
        ),
        // Divider
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 60),
          child: Divider(
            height: 32,
            color: kcOnPrimaryColor,
            thickness: .6,
          ),
        ),

        // Yer ve Ayet bilgisi
        _suraInfoView(),
        verticalSpace(30),

        // Besmele
        SvgPicture.asset(kiBismillah),
        verticalSpace(26),
      ],
    );
  }

  final TextStyle _infoTextStyle = const TextStyle(
    fontSize: 14,
    color: kcOnPrimaryColor,
    fontWeight: FontWeight.w500,
  );

  Row _suraInfoView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(sura.yer.toUpperCase().replaceAll("I", "İ"),
            style: _infoTextStyle),
        const Text(
          " • ",
          style: TextStyle(fontSize: 17, color: kcGrayColorLight),
        ),
        Text("${sura.ayetSayisi} AYET", style: _infoTextStyle),
      ],
    );
  }

  Align _quranPicture() {
    return Align(
      alignment: Alignment.bottomRight,
      child: BlendMask(
        blendMode: BlendMode.softLight,
        child: SvgPicture.asset(kiQuran2),
      ),
    );
  }
}
