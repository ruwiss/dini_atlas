import 'package:dini_atlas/app/app.bottomsheets.dart';
import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/extensions/string_extensions.dart';
import 'package:dini_atlas/models/content_type.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/widgets/shareable_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stacked_services/stacked_services.dart';

class ContentWidget extends StatefulWidget {
  const ContentWidget({
    super.key,
    required this.type,
    required this.number,
    this.text1,
    this.text2,
    this.text3,
    this.words,
    this.titleText,
    this.isPlaying = false,
    this.isPlayerLoading = false,
    this.isSaved = false,
    this.onPlay,
    this.onPause,
    this.onBookmarkTap,
    this.increaseFontSize = 0,
    this.hideDivider = false,
    this.titlePadding,
    this.highlightText,
    this.onSaveLastAyah,
    this.isSavedLastAyah = false,
  });
  final ContentTypes type;
  final int number;

  /// Arapça
  final String? text1;

  /// Türkçe
  final String? text2;

  /// Meal
  final String? text3;

  /// Kelimeler (info)
  final String? words;
  final String? titleText;
  final bool isPlaying;
  final bool isPlayerLoading;
  final bool isSaved;
  final VoidCallback? onPlay;
  final VoidCallback? onPause;
  final VoidCallback? onBookmarkTap;
  final double increaseFontSize;
  final bool hideDivider;
  final EdgeInsetsGeometry? titlePadding;
  final String? highlightText;
  final VoidCallback? onSaveLastAyah;
  final bool isSavedLastAyah;

  @override
  State<ContentWidget> createState() => _QuranSuraItemState();
}

class _QuranSuraItemState extends State<ContentWidget> {
  GlobalKey? suraKey;
  late GlobalKey<State<StatefulWidget>> _previewKey;
  bool _onShare = false;

  void _setOnShare(bool val) => setState(() => _onShare = val);

  void _shareButton() async {
    try {
      _previewKey = GlobalKey();
      _setOnShare(true);
      final view = (suraKey!.currentWidget);
      await locator<BottomSheetService>().showCustomSheet(
        title: "Resminiz Hazır",
        variant: BottomSheetType.image,
        data: {
          "button": ElevatedButton(
            onPressed: () async {
              final bytes = await shareViewAsImage(_previewKey);
              _setOnShare(false);
              if (bytes == null) return;
              Share.shareXFiles([
                XFile.fromData(
                  bytes,
                  mimeType: "image/png",
                  name: widget.number.toString(),
                ),
              ]);
            },
            child: const Text("Paylaş"),
          ),
          "image": _shareWidgetPreview(child: view!),
        },
        useRootNavigator: true,
      );
      _setOnShare(false);
    } catch (e) {
      _setOnShare(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_onShare) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text("Paylaşılıyor.."),
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(top: widget.hideDivider ? 5 : 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: widget.titlePadding ??
                  const EdgeInsets.symmetric(horizontal: 13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kcGrayColorMedium,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        // Numara görünümü
                        _ayahNumber(),
                        // Başlık metni
                        if (widget.titleText case final String titleText) ...[
                          horizontalSpaceSmall,
                          Expanded(
                            child: Text(
                              titleText,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                            ),
                          )
                        ]
                      ],
                    ),
                  ),
                  // Action Buttons
                  _actionButtons(),
                ],
              ),
            ),
            _textViews(),
            if (widget.words case final String words) ...[
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  words.delFromBeginAndEndIfAvailable('"'),
                  style: TextStyle(fontSize: 13 + widget.increaseFontSize),
                ),
              ),
            ],
            if (!widget.hideDivider &&
                widget.words != null &&
                widget.words!.isEmpty)
              const Divider()
          ],
        ),
      );
    }
  }

  Widget _textViews() {
    return ShareableView(
      builder: (key) {
        if (key.currentContext == null) {
          suraKey = key;
        }
        return SelectionArea(
          child: Column(
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
          ),
        );
      },
    );
  }

  Widget _suraMeal() {
    final String text = widget.text3!;
    if (widget.highlightText case final String query) {
      return highlightedText(data: text, target: query);
    } else {
      return Text(
        text,
        style: TextStyle(
          fontSize: 16 + widget.increaseFontSize,
          color: kcPrimaryColorDark,
        ),
      );
    }
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
    final bool isHadith = widget.type.type == EContentTypes.hadis;
    return Text(
      text,
      textAlign: TextAlign.end,
      style: TextStyle(
        color: kcPrimaryColorDark,
        fontFamily: "Uthman",
        fontSize: 22 + widget.increaseFontSize,
        height: isHadith ? 1.5 : 2.3,
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
              widget.isSaved ? kiHeartFill : kiHeart,
            ),
          ),
        if (widget.onSaveLastAyah != null)
          IconButton(
            onPressed: () => widget.onSaveLastAyah?.call(),
            icon: SvgPicture.asset(
              widget.isSavedLastAyah ? kiBookmarkChecked : kiBookmarkUnchecked,
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

  Text highlightedText(
      {required String data, required String target, TextStyle? style}) {
    final textSpans = List.empty(growable: true);
    final escapedTarget = RegExp.escape(target);
    final pattern = RegExp(escapedTarget, caseSensitive: false);
    final matches = pattern.allMatches(data);

    int currentIndex = 0;
    for (final match in matches) {
      final beforeMatch = data.substring(currentIndex, match.start);
      if (beforeMatch.isNotEmpty) {
        textSpans.add(TextSpan(text: beforeMatch));
      }

      final matchedText = data.substring(match.start, match.end);
      textSpans.add(
        TextSpan(
          text: matchedText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: kcPrimaryColorLight,
          ),
        ),
      );

      currentIndex = match.end;
    }

    if (currentIndex < data.length) {
      final remainingText = data.substring(currentIndex);
      textSpans.add(TextSpan(text: remainingText));
    }

    return Text.rich(
      style: style ??
          TextStyle(
            fontSize: 16 + widget.increaseFontSize,
            color: kcPrimaryColorDark,
          ),
      TextSpan(children: <TextSpan>[...textSpans]),
    );
  }

  Widget _shareWidgetPreview({required Widget child}) {
    return RepaintBoundary(
      key: _previewKey,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kcBackgroundColor,
          borderRadius: borderRadiusMedium,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            child,
            verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Dinî Atlas - Play Store"),
                horizontalSpace(15),
                Image.asset(kiLogo, height: 25),
              ],
            )
          ],
        ),
      ),
    );
  }
}
