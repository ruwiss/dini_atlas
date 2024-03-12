import 'package:dini_atlas/ui/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class DotView extends StatelessWidget {
  const DotView({super.key, required this.isActive});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        color: isActive
            ? kcGrayColor.withOpacity(.75)
            : kcGrayColor.withOpacity(.3),
        shape: BoxShape.circle,
      ),
    );
  }
}
