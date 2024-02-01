import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuranSurahList extends StatelessWidget {
  const QuranSurahList({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 15,
        itemBuilder: (context, index) {
          return _surahItem(hideDivider: index == 14);
        },
      ),
    );
  }

  final TextStyle _surahItemSubStyle = const TextStyle(
    fontSize: 12,
    color: kcGrayColor,
    fontWeight: FontWeight.w500,
  );

  Widget _surahItem({bool hideDivider = false}) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          verticalSpace(16),
          Row(
            children: [
              // Sure numarası, çerçeve görünümü
              Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(kiAyahFrame),
                  const Text(
                    "1",
                    style: TextStyle(
                      fontSize: 14,
                      color: kcPrimaryColorDark,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),

              horizontalSpace(16),

              // Sure adı, numarası, bilgisi
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sure ismi
                  const Text(
                    "Fâtiha",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: kcPrimaryColorDark,
                    ),
                  ),
                  // Sure bilgisi
                  Row(
                    children: [
                      Text("MEKKİ", style: _surahItemSubStyle),
                      Text(
                        " • ",
                        style: TextStyle(
                          fontSize: 15,
                          color: kcGrayColor.withOpacity(.3),
                        ),
                      ),
                      Text("7 AYET", style: _surahItemSubStyle),
                    ],
                  )
                ],
              ),

              const Spacer(),

              // Arapça Sure adı
              const Text(
                "الفاتحة",
                style: TextStyle(
                  fontFamily: "Amiri",
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: kcPrimaryColorLight,
                ),
              )
            ],
          ),
          verticalSpace(14),
          if (!hideDivider) const Divider(),
          if (hideDivider) verticalSpaceMedium,
        ],
      ),
    );
  }
}
