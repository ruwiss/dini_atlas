import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoFavouriteWidget extends StatelessWidget {
  const NoFavouriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Opacity(
          opacity: .5,
          child: Padding(
            padding: const EdgeInsets.only(top: 100, bottom: 25),
            child: SvgPicture.asset(kiEmptyBox, width: 180),
          ),
        ),
        Text(
          "Burası şuan boş görünüyor. Bir şeyler kaydetmek için Ayet, hadis veya dua sayfalarına gidin.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: kcPrimaryColorDark.withOpacity(.5),
          ),
        ),
      ],
    );
  }
}
