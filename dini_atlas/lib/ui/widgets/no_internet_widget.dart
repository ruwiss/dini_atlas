import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Image.asset(kiNoInternetGif),
          ),
          const Text(
            "Üzgünüm",
            style: TextStyle(
              color: kcGrayColor,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          verticalSpaceMedium,
          const Text(
            "Şuanda bir internet bağlantısına ihtiyacınız var.",
            textAlign: TextAlign.center,
            style: TextStyle(color: kcGrayColor, fontSize: 18),
          )
        ],
      ),
    );
  }
}
