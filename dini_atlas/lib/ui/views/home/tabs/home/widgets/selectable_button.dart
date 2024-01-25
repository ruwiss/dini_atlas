import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:flutter/material.dart';

class SelectableSettingButton<T> extends StatelessWidget {
  final T value;
  final String text;
  final bool selected;
  final Function(T value)? onTap;
  const SelectableSettingButton(
      {super.key, required this.value, required this.text, this.selected = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(value),
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
