import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/dialogs/settings/settings_base_dialog.dart';
import 'package:flutter/material.dart';

import '../../views/home/tabs/home/widgets/selectable_button.dart';
import '../../views/home/tabs/home/widgets/selectable_tile.dart';

enum SettingTimeSelection { dk5, dk15, dk30 }

class SettingsNotiDialog extends StatefulWidget {
  const SettingsNotiDialog({super.key});

  @override
  State<SettingsNotiDialog> createState() => _SettingsNotiDialogState();
}

class _SettingsNotiDialogState extends State<SettingsNotiDialog> {
  SettingTimeSelection _timeSelection = SettingTimeSelection.dk15;
  int _soundSelection = 0;

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
                      text: switch (e) {
                        SettingTimeSelection.dk5 => "5 dk",
                        SettingTimeSelection.dk15 => "15 dk",
                        SettingTimeSelection.dk30 => "30 dk",
                      },
                      selected: e == _timeSelection,
                      onTap: (_) => setState(() => _timeSelection = e),
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
                text: "Örnek Ses $index",
                selected: _soundSelection == index,
                onTap: (_) => setState(() => _soundSelection = index),
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
