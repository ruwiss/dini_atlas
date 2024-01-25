import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:flutter/material.dart';

class SelectableSettingButton extends StatelessWidget {
  final String text;
  final bool selected;
  final Function(String text)? onTap;
  const SelectableSettingButton(
      {super.key, required this.text, this.selected = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(text),
      child: Card(
        surfaceTintColor: kcBackgroundColor,
        color: selected ? kcPurpleColorMedium : kcBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 3),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: selected ? kcBackgroundColor : kcPrimaryColorDark,
            ),
          ),
        ),
      ),
    );
  }
}
