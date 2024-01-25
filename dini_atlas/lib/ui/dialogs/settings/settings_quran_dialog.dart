import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/views/home/tabs/home/widgets/selectable_tile.dart';
import 'package:flutter/material.dart';

import 'settings_base_dialog.dart';

class SettingsQuranDialog extends StatefulWidget {
  const SettingsQuranDialog({super.key});

  @override
  State<SettingsQuranDialog> createState() => _SettingsQuranDialogState();
}

class _SettingsQuranDialogState extends State<SettingsQuranDialog> {
  int _soundSelection = 0;

  @override
  Widget build(BuildContext context) {
    return SettingsBaseDialog(
      title: "Kur’an okuyucuları",
      svgIcon: kiEar,
      showDivider: false,
      bottomWidget: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 300),
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(
              10,
              (index) => SettingsSelectableTile(
                text: "ﻲﻤﺠﻌﻟا ﻲﻠﻋ ﻦﺑ ﺪﻤﺣأ",
                selected: _soundSelection == index,
                onTap: (_) => setState(() => _soundSelection = index),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
