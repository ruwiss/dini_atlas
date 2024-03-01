import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';

import 'settings_dialog.dart';

class HomeSettingsDialog extends StatelessWidget {
  const HomeSettingsDialog({
    super.key,
    this.onChangedSilentMode,
    required this.silentEnabled,
    this.onChangedAlarmMode,
    required this.alarmModeEnabled,
  });
  final Function(bool v)? onChangedSilentMode;
  final bool silentEnabled;
  final Function(bool v)? onChangedAlarmMode;
  final bool alarmModeEnabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SettingsBaseDialogItem(
          checkboxValue: alarmModeEnabled,
          title: "Alarm Modu",
          svgIcon: kiAlarm,
          subtitle:
              "Vakit bildirimlerinin doğru çalışması için kullanılması önerilir.",
          onChanged: onChangedAlarmMode,
          showDivider: true,
        ),
        verticalSpace(20),
        SettingsBaseDialogItem(
          checkboxValue: silentEnabled,
          title: "Sessiz Mod",
          svgIcon: kiEar,
          subtitle: "Namaz vaktinden 5 dk önce başlar ve 30 dk sonra biter",
          onChanged: onChangedSilentMode,
          showDivider: false,
        ),
      ],
    );
  }
}
