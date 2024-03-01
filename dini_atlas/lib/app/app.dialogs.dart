// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/remove_ads/remove_ads_dialog.dart';
import '../ui/dialogs/settings/settings_dialog.dart';

enum DialogType {
  settings,
  removeAds,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.settings: (context, request, completer) =>
        SettingsDialog(request: request, completer: completer),
    DialogType.removeAds: (context, request, completer) =>
        RemoveAdsDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
