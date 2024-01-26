import 'package:dini_atlas/ui/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked_services/stacked_services.dart';

class SettingsDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const SettingsDialog({
    super.key,
    required this.request,
    required this.completer,
  });

  @override
  Widget build(BuildContext context) {
    final Widget data = request.data ?? [];
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: kcBackgroundColor,
      surfaceTintColor: kcBackgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _headerWidget(),
          Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 14),
            margin: const EdgeInsets.only(bottom: 10),
            color: kcBackgroundColor,
            child: data,
          )
        ],
      ),
    );
  }

  Container _headerWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: kcGrayColorLightSoft,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.settings,
            size: 30,
            color: kcGrayColorSoft,
          ),
          horizontalSpace(24),
          Text(
            request.title ?? "Ayarlar",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: kcGrayColorSoft,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () => completer(DialogResponse(confirmed: false)),
            icon: const Icon(
              Icons.close,
              size: 33,
              color: kcGrayColorSoft,
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsBaseDialog extends StatefulWidget {
  final bool checkboxValue;
  final String title;
  final String svgIcon;
  final String? subtitle;
  final Widget? bottomWidget;
  final bool showDivider;
  final bool disabled;
  final Function(bool value)? onChanged;
  const SettingsBaseDialog({
    super.key,
    this.checkboxValue = false,
    required this.title,
    required this.svgIcon,
    this.showDivider = true,
    this.subtitle,
    this.bottomWidget,
    this.onChanged,
    this.disabled = false,
  });

  @override
  State<SettingsBaseDialog> createState() => _SettingsBaseDialogState();
}

class _SettingsBaseDialogState extends State<SettingsBaseDialog> {
  late bool _checkboxValue;

  @override
  void initState() {
    _checkboxValue = widget.checkboxValue;
    super.initState();
  }

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
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color:
                              widget.disabled ? kcGrayColorSoft : kcGrayColor,
                        ),
                      ),
                      if (widget.subtitle != null)
                        Text(
                          widget.subtitle!,
                          style: TextStyle(
                            fontSize: 12,
                            color:
                                widget.disabled ? kcGrayColorSoft : kcGrayColor,
                          ),
                        )
                    ],
                  ),
                ),
              ),
              widget.onChanged != null
                  ? Checkbox(
                      value: _checkboxValue,
                      activeColor: widget.disabled ? kcGrayColor : null,
                      onChanged: (value) {
                        setState(() => _checkboxValue = value!);
                        widget.onChanged?.call(value!);
                      },
                    )
                  : verticalSpaceLarge,
            ],
          ),
          if (widget.bottomWidget != null)
            AbsorbPointer(
              absorbing: widget.disabled,
              child: widget.bottomWidget!,
            ),
          if (widget.showDivider) ...[
            verticalSpace(23),
            const Divider(height: 1),
          ]
        ],
      ),
    );
  }
}
