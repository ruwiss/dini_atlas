import 'package:dini_atlas/models/quran/quran_reciter.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/home/tabs/home/widgets/selectable_tile.dart';
import 'package:flutter/material.dart';

import 'settings_dialog.dart';

class SettingsQuranDialog extends StatefulWidget {
  const SettingsQuranDialog(
      {super.key,
      required this.quranReciters,
      required this.currentReciterId,
      this.onSelectedReciter});
  final List<QuranReciter> quranReciters;
  final int currentReciterId;
  final Function(QuranReciter reciter)? onSelectedReciter;

  @override
  State<SettingsQuranDialog> createState() => _SettingsQuranDialogState();
}

class _SettingsQuranDialogState extends State<SettingsQuranDialog> {
  late int _selectedId;

  @override
  void initState() {
    _selectedId = widget.currentReciterId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 600),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SettingsBaseDialog(
              checkboxValue: true,
              title: "Arapça metin",
              subtitle: "Kuran Arapça metni gizleyin",
              svgIcon: kiEye,
              onChanged: (value) async {},
            ),
            verticalSpaceMedium,
            SettingsBaseDialog(
              checkboxValue: true,
              title: "Türkçe metin",
              subtitle: "Kuran'ın Türkçe okunuş metnini gizleyin",
              svgIcon: kiEye,
              onChanged: (value) async {},
            ),
            verticalSpaceMedium,
            SettingsBaseDialog(
              checkboxValue: true,
              title: "Türkçe meal",
              subtitle: "Kuran'ın Turkçe mealini gizleyin",
              svgIcon: kiEye,
              onChanged: (value) async {},
            ),
            verticalSpaceMedium,
            SettingsBaseDialog(
              checkboxValue: true,
              title: "Diğer ayete geç",
              subtitle: "Ayet sesli okunuşu bitince otomatik diğer ayete geç",
              svgIcon: kiRobot,
              onChanged: (value) async {},
            ),
            verticalSpaceSmall,
            SettingsBaseDialog(
              title: "Kur’an okuyucuları",
              svgIcon: kiEar,
              showDivider: false,
              bottomWidget: Column(
                children: List.generate(
                  widget.quranReciters.length,
                  (index) {
                    final QuranReciter reciter = widget.quranReciters[index];
                    return SettingsSelectableTile(
                      value: reciter.id,
                      text: reciter.name,
                      selected: _selectedId == reciter.id,
                      onTap: (value) {
                        _selectedId = reciter.id;
                        setState(() {});
                        widget.onSelectedReciter?.call(reciter);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
