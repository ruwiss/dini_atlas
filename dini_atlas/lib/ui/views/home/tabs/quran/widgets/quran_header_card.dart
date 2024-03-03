import 'package:dini_atlas/models/user_setting.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuranSuraHeader extends StatefulWidget {
  const QuranSuraHeader({
    super.key,
    this.lastReadAyah,
    required this.visible,
    this.onTap,
  });
  final SavedLastAyah? lastReadAyah;
  final bool visible;
  final VoidCallback? onTap;

  @override
  State<QuranSuraHeader> createState() => _QuranSuraHeaderState();
}

class _QuranSuraHeaderState extends State<QuranSuraHeader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  bool _showHeader = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  void _setAnimation() {
    if (widget.visible) {
      setState(() => _showHeader = true);
      _animationController.forward();
    } else {
      _animationController.reverse().then((_) {
        setState(() => _showHeader = false);
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _setAnimation();
    if (widget.lastReadAyah case final SavedLastAyah lastReadAyah) {
      return FadeTransition(
        opacity: _animationController,
        child: !_showHeader
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 17),
                child: InkWell(
                  borderRadius: borderRadiusMedium,
                  onTap: widget.onTap,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: borderRadiusMedium,
                      gradient: const LinearGradient(colors: [
                        kcPurpleColorMedium,
                        kcPurpleColorDark,
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: paddingMedium,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(kiReadme),
                                  horizontalSpace(8),
                                  const Text(
                                    "Son Okunan",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: kcOnPrimaryColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 4),
                                child: Text(
                                  lastReadAyah.sura,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: kcOnPrimaryColor,
                                  ),
                                ),
                              ),
                              Text(
                                "Ayet No: ${lastReadAyah.ayah}",
                                style: const TextStyle(
                                    fontSize: 14, color: kcOnPrimaryColor),
                              )
                            ],
                          ),
                        ),
                        Flexible(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(10)),
                            child: SvgPicture.asset(kiCardImage,
                                fit: BoxFit.cover),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      );
    } else {
      return const SizedBox();
    }
  }
}
