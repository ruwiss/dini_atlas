import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/dialogs/settings/settings_base_dialog.dart';
import 'package:flutter/material.dart';

import '../../views/home/tabs/home/widgets/selectable_button.dart';
import '../../views/home/tabs/home/widgets/selectable_tile.dart';

enum SettingTimeSelection {
  dk5(5),
  dk15(15),
  dk30(30);

  final int time;
  const SettingTimeSelection(this.time);
}

class SettingsNotiDialog extends StatefulWidget {
  final int advancedVoiceWarningTime;
  final int warningSoundId;
  final Function(int value)? onWarningSoundChanged;
  final Function(int value)? onAdvancedVoiceWarningTimeChanged;
  const SettingsNotiDialog({
    super.key,
    required this.advancedVoiceWarningTime,
    required this.warningSoundId,
    this.onWarningSoundChanged,
    this.onAdvancedVoiceWarningTimeChanged,
  });

  @override
  State<SettingsNotiDialog> createState() => _SettingsNotiDialogState();
}

class _SettingsNotiDialogState extends State<SettingsNotiDialog> {
  late int _selectedTime;
  late int _selectedSound;

  @override
  void initState() {
    _selectedTime = widget.advancedVoiceWarningTime;
    _selectedSound = widget.warningSoundId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SettingsBaseDialog(
          title: "Sesli Uyarı",
          svgIcon: kiEar,
        ),
        verticalSpaceMedium,
        SettingsBaseDialog(
          title: "Önceden Uyar",
          svgIcon: kiEar,
          bottomWidget: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: SettingTimeSelection.values
                  .map(
                    (e) => SelectableSettingButton(
                      value: e.time,
                      text: "${e.time} dakika",
                      selected: e.time == _selectedTime,
                      onTap: (value) {
                        widget.onAdvancedVoiceWarningTimeChanged?.call(value);
                        _selectedTime = e.time;
                        setState(() {});
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        verticalSpaceSmall,
        SettingsBaseDialog(
          title: "Uyarı Sesleri",
          svgIcon: kiEar,
          bottomWidget: Column(
            children: List.generate(
              3,
              (index) => SettingsSelectableTile(
                value: _selectedSound,
                text: "Örnek Ses $index",
                selected: _selectedSound == index,
                onTap: (value) {
                  widget.onWarningSoundChanged?.call(value);
                  _selectedSound = index;
                  setState(() {});
                },
              ),
            ),
          ),
        ),
        verticalSpaceSmall,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
              onPressed: () {},
              color: kcGrayColorLightSoft,
              child: const Text(
                "Tümüne Uygula",
                style: TextStyle(fontSize: 14, color: kcPrimaryColorDark),
              ),
            ),
            MaterialButton(
              onPressed: () {},
              color: kcPurpleColorLight,
              child: const Text(
                "Kaydet",
                style: TextStyle(fontSize: 14, color: kcPrimaryColorDark),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
