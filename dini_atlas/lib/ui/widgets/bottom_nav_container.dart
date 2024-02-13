import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:flutter/material.dart';

class BottomNavContainer extends StatelessWidget {
  const BottomNavContainer({
    super.key,
    required this.child,
    this.backgroundColor,
  });
  final Widget child;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? kcBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: kcShadowColor.withOpacity(.2),
            spreadRadius: 0,
            blurRadius: 16,
            offset: const Offset(0, -1),
          )
        ],
      ),
      child: child,
    );
  }
}
