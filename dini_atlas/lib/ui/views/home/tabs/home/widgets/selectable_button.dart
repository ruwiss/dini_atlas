import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:flutter/material.dart';

class SelectableSettingButton extends StatefulWidget {
  final String text;
  final bool selected;
  final Function(String text)? onTap;
  const SelectableSettingButton(
      {super.key, required this.text, this.selected = false, this.onTap});

  @override
  State<SelectableSettingButton> createState() =>
      _SelectableSettingButtonState();
}

class _SelectableSettingButtonState extends State<SelectableSettingButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap?.call(widget.text),
      child: Card(
        surfaceTintColor: kcBackgroundColor,
        color: widget.selected ? kcPurpleColorMedium : kcBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 3),
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: widget.selected ? kcBackgroundColor : kcPrimaryColorDark,
            ),
          ),
        ),
      ),
    );
  }
}
