import 'package:dini_atlas/extensions/string_extensions.dart';
import 'package:dini_atlas/models/content_type.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/widgets/shareable_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';

class ContentWidget extends StatefulWidget {
  const ContentWidget({
    super.key,
    required this.type,
    required this.number,
    this.text1,
    this.text2,
    this.text3,
    this.titleText,
    this.isPlaying = false,
    this.isPlayerLoading = false,
    this.isSaved = false,
    this.onPlay,
    this.onPause,
    this.onBookmarkTap,
    this.increaseFontSize = 0,
  });
  final ContentTypes type;
  final int number;
  final String? text1;
  final String? text2;
  final String? text3;
  final String? titleText;
  final bool isPlaying;
  final bool isPlayerLoading;
  final bool isSaved;
  final Function()? onPlay;
  final Function()? onPause;
  final Function()? onBookmarkTap;
  final double increaseFontSize;

  @override
  State<ContentWidget> createState() => _QuranSuraItemState();
}

class _QuranSuraItemState extends State<ContentWidget> {
  GlobalKey? _suraKey;

  void _shareButton() async {
    final bytes = await shareViewAsImage(_suraKey);
    Share.shareXFiles([
      XFile.fromData(bytes!,
          mimeType: "image/png", name: widget.number.toString()),
    ]);
  }

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
                Row(
                  children: [
                    // Numara görünümü
                    _ayahNumber(),
                    // Başlık metni
                    if (widget.titleText case final String titleText) ...[
                      horizontalSpaceSmall,
                      Text(
                        titleText,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      )
                    ]
                  ],
                ),
                // Action Buttons
                _actionButtons(),
              ],
            ),
          ),
          _textViews(),
          const Divider()
        ],
      ),
    );
  }

  Widget _textViews() {
    return ShareableView(
      builder: (key) {
        _suraKey = key;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Arapça Kısım
            if (widget.text1 != null) ...[verticalSpace(24), _suraArabic()],

            // Türkçe Okunuş
            if (widget.text2 != null) ...[verticalSpace(18), _suraTurkish()],

            // Meal Kısmı
            if (widget.text3 != null) ...[verticalSpace(8), _suraMeal()],
            verticalSpace(18),
          ],
        );
      },
    );
  }

  Widget _suraMeal() {
    return Text(
      widget.text3!,
      style: TextStyle(
        fontSize: 16 + widget.increaseFontSize,
        color: kcPrimaryColorDark,
      ),
    );
  }

  Widget _suraTurkish() {
    return Text(
      widget.text2!.fixLatinArabicLetters(),
      style: TextStyle(
        fontSize: 16 + widget.increaseFontSize,
        color: kcPrimaryColorDark,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget _suraArabic() {
    const String bismillah = "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ";
    String text = widget.text1!.replaceAll("۞", "");
    // İlk ayette besmele varsa, sil
    if (text.startsWith(bismillah) && text.length > bismillah.length) {
      text = text.replaceAll(bismillah, "");
    }
    return Text(
      text,
      textAlign: TextAlign.end,
      style: TextStyle(
        color: kcPrimaryColorDark,
        fontFamily: "Uthman",
        fontSize: 22 + widget.increaseFontSize,
        height: 2.3,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Row _actionButtons() {
    return Row(
      children: [
        if (!widget.type.hideShareButton)
          IconButton(onPressed: _shareButton, icon: SvgPicture.asset(kiShare)),
        if (!widget.type.hidePlayButton)
          // Eğer oynatılıyorsa, pause ikonu getir
          widget.isPlaying
              ? IconButton(
                  onPressed: () => widget.onPause?.call(),
                  icon: SvgPicture.asset(kiPause))
              // Eğer mevcut ayet oynatılmıyorsa ancak yükleniyorsa, yükleniyor ikonu getir
              : widget.isPlayerLoading
                  ? const SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(strokeWidth: 3.3))
                  // Eğer mevcut ayet oynatılmıyorsa, play ikonu getir
                  : IconButton(
                      onPressed: () => widget.onPlay?.call(),
                      icon: SvgPicture.asset(kiPlay)),
        if (!widget.type.hideBookmarkButton)
          IconButton(
            onPressed: () => widget.onBookmarkTap?.call(),
            icon: SvgPicture.asset(
              widget.isSaved ? kiBookmarkChecked : kiBookmarkUnchecked,
            ),
          )
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
        "${widget.number}",
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: kcOnPrimaryColor,
        ),
      ),
    );
  }
}
