import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/views/home/tabs/home/widgets/selectable_tile.dart';
import 'package:flutter/material.dart';
import 'settings_dialog.dart';

class SettingsQuranDialog extends StatefulWidget {
  final int quranReciterId;
  final Function(int value)? onRecitedIdChanged;
  const SettingsQuranDialog(
      {super.key, required this.quranReciterId, this.onRecitedIdChanged});

  @override
  State<SettingsQuranDialog> createState() => _SettingsQuranDialogState();
}

class _SettingsQuranDialogState extends State<SettingsQuranDialog> {
  late int _soundSelection;

  @override
  void initState() {
     _soundSelection = widget.quranReciterId;
    super.initState();
  }

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
                value: index,
                text: "ﻲﻤﺠﻌﻟا ﻲﻠﻋ ﻦﺑ ﺪﻤﺣأ",
                selected: _soundSelection == index,
                onTap: (value) {
                  widget.onRecitedIdChanged?.call(value);
                  _soundSelection = index;
                  setState(() {});
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
