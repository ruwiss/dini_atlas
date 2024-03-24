import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'settings_dialog.dart';

class HomeSettingsDialog extends StatelessWidget {
  const HomeSettingsDialog({
    super.key,
    this.onChangedSilentMode,
    required this.silentEnabled,
    this.onChangedAlarmMode,
    required this.alarmModeEnabled,
    required this.hideAyet,
    this.onChangedHideAyet,
    required this.hideHadis,
    this.onChangedHideHadis,
    required this.hideDua,
    this.onChangedHideDua,
    required this.hideBabyNames,
    this.onChangedHideBabyNames,
  });
  final Function(bool v)? onChangedSilentMode;
  final bool silentEnabled;
  final Function(bool v)? onChangedAlarmMode;
  final bool alarmModeEnabled;
  final Function(bool v)? onChangedHideAyet;
  final bool hideAyet;
  final Function(bool v)? onChangedHideHadis;
  final bool hideHadis;
  final Function(bool v)? onChangedHideDua;
  final bool hideDua;
  final Function(bool v)? onChangedHideBabyNames;
  final bool hideBabyNames;

  @override
  Widget build(BuildContext context) {
    return ListView(
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
        verticalSpace(10),
        SettingsBaseDialogItem(
          checkboxValue: silentEnabled,
          title: "Sessiz Mod",
          svgIcon: kiEar,
          subtitle: "Namaz vaktinden 5 dk önce başlar ve 30 dk sonra biter",
          onChanged: onChangedSilentMode,
          showDivider: true,
        ),
        verticalSpace(20),
        SettingsBaseDialogItem(
          checkboxValue: hideAyet,
          title: "Vaktin Ayetini Gizle",
          svgIcon: kiEye,
          onChanged: onChangedHideAyet,
          showDivider: true,
        ),
        verticalSpace(20),
        SettingsBaseDialogItem(
          checkboxValue: hideHadis,
          title: "Vaktin Hadisini Gizle",
          svgIcon: kiEye,
          onChanged: onChangedHideHadis,
          showDivider: true,
        ),
        verticalSpace(20),
        SettingsBaseDialogItem(
          checkboxValue: hideDua,
          title: "Vaktin Duasını Gizle",
          svgIcon: kiEye,
          onChanged: onChangedHideDua,
          showDivider: true,
        ),
        verticalSpace(20),
        SettingsBaseDialogItem(
          checkboxValue: hideBabyNames,
          title: "Vaktin İsimlerini Gizle",
          svgIcon: kiEye,
          onChanged: onChangedHideBabyNames,
          showDivider: false,
        ),
        verticalSpace(20),
      ],
    );
  }
}
