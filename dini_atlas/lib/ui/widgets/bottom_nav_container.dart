import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:flutter/material.dart';

class BottomNavContainer extends StatelessWidget {
  const BottomNavContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kcBackgroundColor,
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
