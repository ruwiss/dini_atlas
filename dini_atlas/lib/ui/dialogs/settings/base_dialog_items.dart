import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BaseHomeDialogItem1 extends StatefulWidget {
  final String title;
  final String svgIcon;
  final String? subtitle;
  final Widget? bottomWidget;
  final bool showDivider;
  final Function(bool value)? onChanged;
  const BaseHomeDialogItem1(
      {super.key,
      required this.title,
      required this.svgIcon,
      this.showDivider = true,
      this.subtitle,
      this.bottomWidget,
      this.onChanged});

  @override
  State<BaseHomeDialogItem1> createState() => _BaseHomeDialogItem1State();
}

class _BaseHomeDialogItem1State extends State<BaseHomeDialogItem1> {
  bool checkbox1 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              value: checkbox1,
              onChanged: (value) {
                setState(() => checkbox1 = value!);
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
    );
  }
}
