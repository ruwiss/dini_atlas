import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsBaseDialog extends StatefulWidget {
  final String title;
  final String svgIcon;
  final String? subtitle;
  final Widget? bottomWidget;
  final bool showDivider;
  final Function(bool value)? onChanged;
  const SettingsBaseDialog(
      {super.key,
      required this.title,
      required this.svgIcon,
      this.showDivider = true,
      this.subtitle,
      this.bottomWidget,
      this.onChanged});

  @override
  State<SettingsBaseDialog> createState() => _SettingsBaseDialogState();
}

class _SettingsBaseDialogState extends State<SettingsBaseDialog> {
  bool checkbox = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kcBackgroundColor,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(widget.svgIcon),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: kcGrayColor,
                        ),
                      ),
                      if (widget.subtitle != null)
                        Text(
                          widget.subtitle!,
                          style:
                              const TextStyle(fontSize: 12, color: kcGrayColor),
                        )
                    ],
                  ),
                ),
              ),
              Checkbox(
                value: checkbox,
                onChanged: (value) {
                  setState(() => checkbox = value!);
                  widget.onChanged?.call(value!);
                },
              ),
            ],
          ),
          if (widget.bottomWidget != null) widget.bottomWidget!,
          if (widget.showDivider) ...[
            verticalSpace(23),
            const Divider(height: 1),
          ]
        ],
      ),
    );
  }
}
