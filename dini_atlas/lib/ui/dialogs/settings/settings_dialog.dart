import 'package:dini_atlas/ui/common/constants/app_colors.dart';
import 'package:dini_atlas/ui/common/constants/app_images.dart';
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
      insetPadding: const EdgeInsets.all(25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _headerWidget(context),
          if (request.description case final String description)
            _descriptionWidget(description),
          Container(
            constraints: BoxConstraints(maxHeight: screenHeight(context) * .7),
            width: double.infinity,
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

  Widget _descriptionWidget(String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        description,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16, color: kcGrayColor),
      ),
    );
  }

  Container _headerWidget(BuildContext context) {
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
            onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
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

class SettingsBaseDialogItem extends StatefulWidget {
  const SettingsBaseDialogItem({
    super.key,
    this.checkboxValue = false,
    required this.title,
    required this.svgIcon,
    this.showDivider = true,
    this.subtitle,
    this.bottomWidget,
    this.actionWidget,
    this.onChanged,
    this.disabled = false,
  });
  final bool checkboxValue;
  final String title;
  final String svgIcon;
  final String? subtitle;
  final Widget? bottomWidget;
  final Widget? actionWidget;
  final bool showDivider;
  final bool disabled;
  final Function(bool value)? onChanged;

  @override
  State<SettingsBaseDialogItem> createState() => _SettingsBaseDialogItemState();
}

class _SettingsBaseDialogItemState extends State<SettingsBaseDialogItem> {
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
        mainAxisSize: MainAxisSize.min,
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
                  : widget.actionWidget ?? verticalSpaceLarge,
            ],
          ),
          if (widget.bottomWidget != null)
            AbsorbPointer(
              absorbing: widget.disabled,
              child: widget.bottomWidget!,
            ),
          if (widget.showDivider) ...[
            verticalSpace(15),
            const Divider(height: 1, thickness: 1.5, color: kcDividerColor),
          ]
        ],
      ),
    );
  }
}

class FontSizeDialogItem extends StatefulWidget {
  const FontSizeDialogItem({
    super.key,
    required this.min,
    required this.max,
    required this.currentValue,
    this.onChanged,
    this.title,
    this.subtitle,
  });
  final String? title;
  final String? subtitle;
  final int min;
  final int max;
  final int currentValue;
  final Function(int v)? onChanged;

  @override
  State<FontSizeDialogItem> createState() => _FontSizeDialogItemState();
}

class _FontSizeDialogItemState extends State<FontSizeDialogItem> {
  int _fontSize = 0;

  @override
  void initState() {
    _fontSize = widget.currentValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SettingsBaseDialogItem(
      title: widget.title ?? "Yazı Boyutu",
      subtitle: widget.subtitle ?? "Ayet metin boyutunu arttır",
      svgIcon: kiFont,
      actionWidget: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              if (_fontSize != widget.min) {
                setState(() => _fontSize--);
                widget.onChanged?.call(_fontSize);
              }
            },
            child: const Icon(Icons.arrow_left, color: kcGrayColor),
          ),
          horizontalSpaceSmall,
          Text(
            "$_fontSize",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: kcPrimaryColor,
            ),
          ),
          horizontalSpaceSmall,
          GestureDetector(
            onTap: () {
              if (_fontSize != widget.max) {
                setState(() => _fontSize++);
                widget.onChanged?.call(_fontSize);
              }
            },
            child: const Icon(Icons.arrow_right, color: kcGrayColor),
          ),
        ],
      ),
    );
  }
}
