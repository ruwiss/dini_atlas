import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:flutter/material.dart';

class SettingsSelectableTile<T> extends StatelessWidget {
  final T value;
  final String text;
  final bool selected;
  final Function(T value)? onTap;
  final bool disabled;
  const SettingsSelectableTile({
    super.key,
    required this.value,
    required this.text,
    this.selected = false,
    this.onTap,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => disabled ? null : onTap?.call(value),
      child: Padding(
        padding: const EdgeInsets.only(top: 3),
        child: Container(
          decoration: BoxDecoration(
            color: kcGrayColorLightSoft,
            borderRadius: BorderRadius.circular(5),
          ),
          child: ListTile(
            title: Text(
              text,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 18,
                color: selected && !disabled
                    ? kcPrimaryColor
                    : kcGrayColor.withOpacity(.8),
              ),
            ),
            leading: Icon(
              Icons.check,
              color: selected && !disabled
                  ? kcPrimaryColor
                  : kcGrayColor.withOpacity(.8),
            ),
          ),
        ),
      ),
    );
  }
}
