import 'package:audioplayers/audioplayers.dart';
import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/models/user_setting.dart';
import 'package:dini_atlas/ui/common/constants/app_sounds.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../views/home/tabs/home/widgets/selectable_button.dart';
import '../../views/home/tabs/home/widgets/selectable_tile.dart';
import 'settings_dialog.dart';

enum SettingTimeSelection {
  dk5(5),
  dk15(15),
  dk30(30);

  final int time;
  const SettingTimeSelection(this.time);
}

class SettingsNotiDialog extends StatefulWidget {
  final PrayerNotiSettings prayerNotiSettings;
  final Function(PrayerNotiSettings settings)? onSave;
  final Function(PrayerNotiSettings settings)? onSaveAll;
  const SettingsNotiDialog({
    super.key,
    this.onSave,
    this.onSaveAll,
    required this.prayerNotiSettings,
  });

  @override
  State<SettingsNotiDialog> createState() => _SettingsNotiDialogState();
}

class _SettingsNotiDialogState extends State<SettingsNotiDialog> {
  final _player = AudioPlayer();

  final _navigationService = locator<NavigationService>();
  late PrayerNotiSettings _prayerNotiSettings;

  @override
  void initState() {
    _prayerNotiSettings = widget.prayerNotiSettings;
    super.initState();
  }

  @override
  dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SettingsBaseDialogItem(
                    checkboxValue: _prayerNotiSettings.voiceWarningEnable,
                    title: "Sesli Uyarı",
                    svgIcon: kiEar,
                    onChanged: (value) {
                      _prayerNotiSettings.voiceWarningEnable = value;
                      setState(() {});
                    }),
                verticalSpaceMedium,
                SettingsBaseDialogItem(
                  checkboxValue:
                      _prayerNotiSettings.advancedWarningSoundsEnable,
                  title: "Önceden Uyar",
                  svgIcon: kiEar,
                  disabled: !_prayerNotiSettings.voiceWarningEnable ||
                      !_prayerNotiSettings.advancedWarningSoundsEnable,
                  onChanged: (value) {
                    _prayerNotiSettings.advancedWarningSoundsEnable = value;
                    setState(() {});
                  },
                  bottomWidget: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: SettingTimeSelection.values
                          .map(
                            (e) => SelectableSettingButton(
                              value: e.time,
                              text: "${e.time} dk",
                              selected: e.time ==
                                  _prayerNotiSettings.advancedVoiceWarningTime,
                              disabled:
                                  !_prayerNotiSettings.voiceWarningEnable ||
                                      !_prayerNotiSettings
                                          .advancedWarningSoundsEnable,
                              onTap: (value) {
                                _prayerNotiSettings.advancedVoiceWarningTime =
                                    e.time;
                                setState(() {});
                              },
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                verticalSpaceSmall,
                SettingsBaseDialogItem(
                  title: "Uyarı Sesleri",
                  svgIcon: kiEar,
                  disabled: !_prayerNotiSettings.voiceWarningEnable,
                  bottomWidget: Column(
                    children: kaNotiSounds
                        .map(
                          (e) => SettingsSelectableTile(
                            disabled: !_prayerNotiSettings.voiceWarningEnable,
                            value: _prayerNotiSettings.warningSoundId,
                            text: e.name,
                            selected:
                                _prayerNotiSettings.warningSoundId == e.id,
                            onTap: (value) {
                              _player.play(AssetSource(e.path));
                              _prayerNotiSettings.warningSoundId = e.id;
                              setState(() {});
                            },
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
        verticalSpaceSmall,
        _actionButtons(),
      ],
    );
  }

  Widget _actionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {
            widget.onSaveAll?.call(_prayerNotiSettings);
            _navigationService.back();
          },
          child: const Text(
            "Tümüne Uygula",
            style: TextStyle(fontSize: 14, color: kcPrimaryColorDark),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onSave?.call(_prayerNotiSettings);
            _navigationService.back();
          },
          style: ElevatedButton.styleFrom(backgroundColor: kcPurpleColorMedium),
          child: const Text(
            "Kaydet",
            style: TextStyle(
              fontSize: 14,
              color: kcOnPrimaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
