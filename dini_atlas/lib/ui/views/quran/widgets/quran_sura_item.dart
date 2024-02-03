import 'package:dini_atlas/extensions/string_extensions.dart';
import 'package:dini_atlas/models/quran/ayah_list.dart';
import 'package:dini_atlas/models/user_setting.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/widgets/shareable_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';

class QuranSuraItem extends StatefulWidget {
  const QuranSuraItem({
    super.key,
    required this.ayahModel,
    required this.playerAvailable,
    required this.suraSetting,
  });
  final AyahModel ayahModel;
  final bool playerAvailable;
  final SuraSetting suraSetting;

  @override
  State<QuranSuraItem> createState() => _QuranSuraItemState();
}

class _QuranSuraItemState extends State<QuranSuraItem> {
  GlobalKey? _suraKey;

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
          suraTextViews(),
          const Divider()
        ],
      ),
    );
  }

  Widget suraTextViews() {
    return ShareableView(
      builder: (key) {
        _suraKey = key;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Arapça Kısım
            if (widget.suraSetting.showArabicText) ...[
              verticalSpace(24),
              _suraArabic()
            ],

            // Türkçe Okunuş
            if (widget.suraSetting.showTurkishText) ...[
              verticalSpace(18),
              _suraTurkish()
            ],

            // Meal Kısmı
            if (widget.suraSetting.showMeaningText) ...[
              verticalSpace(8),
              _suraMeal()
            ],
            verticalSpace(18),
          ],
        );
      },
    );
  }

  final TextStyle _suraTextStyle = const TextStyle(
    fontSize: 16,
    color: kcPrimaryColorDark,
  );

  Widget _suraMeal() {
    return Text(
      widget.ayahModel.text,
      style: _suraTextStyle,
    );
  }

  Widget _suraTurkish() {
    return Text(
      widget.ayahModel.textOkunus.fixLatinArabicLetters(),
      style: _suraTextStyle.copyWith(fontWeight: FontWeight.w300),
    );
  }

  Widget _suraArabic() {
    const String bismillah = "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ";
    String text = widget.ayahModel.textAr.replaceAll("۞", "");
    // İlk ayette besmele varsa, sil
    if (text.startsWith(bismillah) && text.length > bismillah.length) {
      text = text.replaceAll(bismillah, "");
    }
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
        IconButton(
            onPressed: () async {
              final bytes = await shareViewAsImage(_suraKey);
              Share.shareXFiles([
                XFile.fromData(bytes!,
                    mimeType: "image/png", name: widget.ayahModel.text)
              ]);
            },
            icon: SvgPicture.asset(kiShare)),
        IconButton(
            onPressed: !widget.playerAvailable ? null : () {},
            icon: SvgPicture.asset(kiPlay)),
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
        "${widget.ayahModel.ayet}",
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: kcOnPrimaryColor,
        ),
      ),
    );
  }
}
