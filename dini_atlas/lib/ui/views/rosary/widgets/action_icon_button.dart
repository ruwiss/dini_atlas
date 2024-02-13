import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:flutter/material.dart';

class RosaryActionIconButton extends StatelessWidget {
  const RosaryActionIconButton({super.key, required this.icon, this.onTap});
  final Widget icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      style: IconButton.styleFrom(
        backgroundColor: kcBlueGrayColor.withOpacity(.7),
      ),
      icon: icon,
    );
  }
}
