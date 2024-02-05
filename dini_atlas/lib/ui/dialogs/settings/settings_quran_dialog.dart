import 'package:dini_atlas/models/quran/quran_reciter.dart';
import 'package:dini_atlas/models/user_setting.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/home/tabs/home/widgets/selectable_tile.dart';
import 'package:flutter/material.dart';

import 'settings_dialog.dart';

class SettingsQuranDialog extends StatefulWidget {
  const SettingsQuranDialog({
    super.key,
    required this.suraSetting,
    this.onSuraSettingChanged,
    required this.quranReciters,
    required this.currentReciterId,
    this.onSelectedReciter,
    this.onFontSizeChanged,
    required this.currentFontSizeIncreaseValue,
  });
  final SuraSetting suraSetting;
  final Function(SuraSetting suraSetting)? onSuraSettingChanged;
  final List<QuranReciter> quranReciters;
  final int currentReciterId;
  final Function(QuranReciter reciter)? onSelectedReciter;
  final Function(int v)? onFontSizeChanged;
  final int currentFontSizeIncreaseValue;

  @override
  State<SettingsQuranDialog> createState() => _SettingsQuranDialogState();
}

class _SettingsQuranDialogState extends State<SettingsQuranDialog> {
  late int _selectedId;
  late bool _showArabicText;
  late bool _showTurkishText;
  late bool _showMeaningText;
  late bool _playerAutoChange;

  @override
  void initState() {
    _selectedId = widget.currentReciterId;
    _showArabicText = widget.suraSetting.showArabicText;
    _showTurkishText = widget.suraSetting.showTurkishText;
    _showMeaningText = widget.suraSetting.showMeaningText;
    _playerAutoChange = widget.suraSetting.playerAutoChange;
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
            SettingsBaseDialogItem(
              checkboxValue: _showArabicText,
              title: "Arapça metin",
              subtitle: "Kuran Arapça metni gizleyin",
              svgIcon: kiEye,
              onChanged: (value) async {
                final newValue = widget.suraSetting..showArabicText = value;
                widget.onSuraSettingChanged?.call(newValue);
                setState(() => _showArabicText = value);
              },
            ),
            verticalSpaceMedium,
            SettingsBaseDialogItem(
              checkboxValue: _showTurkishText,
              title: "Türkçe metin",
              subtitle: "Kuran'ın Türkçe okunuş metnini gizleyin",
              svgIcon: kiEye,
              onChanged: (value) async {
                final newValue = widget.suraSetting..showTurkishText = value;
                widget.onSuraSettingChanged?.call(newValue);
                setState(() => _showTurkishText = value);
              },
            ),
            verticalSpaceMedium,
            SettingsBaseDialogItem(
              checkboxValue: _showMeaningText,
              title: "Türkçe meal",
              subtitle: "Kuran'ın Turkçe mealini gizleyin",
              svgIcon: kiEye,
              onChanged: (value) async {
                final newValue = widget.suraSetting..showMeaningText = value;
                widget.onSuraSettingChanged?.call(newValue);
                setState(() => _showMeaningText = value);
              },
            ),
            verticalSpaceMedium,
            SettingsBaseDialogItem(
              checkboxValue: _playerAutoChange,
              title: "Diğer ayete geç",
              subtitle: "Ayet sesli okunuşu bitince otomatik diğer ayete geç",
              svgIcon: kiRobot,
              onChanged: (value) async {
                final newValue = widget.suraSetting..playerAutoChange = value;
                widget.onSuraSettingChanged?.call(newValue);
                setState(() => _playerAutoChange = value);
              },
            ),
            verticalSpaceMedium,
            FontSizeDialogItem(
              min: 0,
              max: 8,
              currentValue: widget.currentFontSizeIncreaseValue,
              onChanged: widget.onFontSizeChanged,
            ),
            verticalSpaceSmall,
            SettingsBaseDialogItem(
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
                        setState(() => _selectedId = reciter.id);
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
