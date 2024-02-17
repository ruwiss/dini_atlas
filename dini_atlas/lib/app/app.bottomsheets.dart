// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/alert/alert_sheet.dart';
import '../ui/bottom_sheets/location/location_sheet.dart';

enum BottomSheetType {
  alert,
  location,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.alert: (context, request, completer) =>
        AlertSheet(request: request, completer: completer),
    BottomSheetType.location: (context, request, completer) =>
        LocationSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
