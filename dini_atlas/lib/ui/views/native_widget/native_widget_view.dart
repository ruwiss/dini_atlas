import 'package:dini_atlas/services/local/app_widget_service.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'native_widget_viewmodel.dart';

enum HomeWidgetType {
  small(kiHomeWidgetPrevSmall, "Küçük"),
  big(kiHomeWidgetPrevBig, "Büyük");

  final String prevImage;
  final String text;
  const HomeWidgetType(this.prevImage, this.text);
}

class NativeWidgetView extends StackedView<NativeWidgetViewModel> {
  const NativeWidgetView({super.key, required this.widgetId});
  final int widgetId;

  @override
  Widget builder(
    BuildContext context,
    NativeWidgetViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Widget Görünümü Seçiniz",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              verticalSpaceLarge,
              _widgetChoiceButton(
                HomeWidgetType.small,
                onTap: () => AppWidgetService.configureMiniWidget(widgetId),
              ),
              verticalSpaceMedium,
              _widgetChoiceButton(
                HomeWidgetType.big,
                reversedRow: true,
                onTap: () => AppWidgetService.configureBigWidget(widgetId),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _widgetChoiceButton(
    HomeWidgetType widgetType, {
    bool reversedRow = false,
    VoidCallback? onTap,
  }) {
    final widgets = [
      Image.asset(widgetType.prevImage, height: 100),
      horizontalSpaceMedium,
      if (reversedRow) const Spacer(),
      Text(widgetType.text, style: const TextStyle(fontSize: 20)),
      if (reversedRow) horizontalSpaceMedium,
    ];
    return InkWell(
      onTap: onTap,
      borderRadius: borderRadiusMedium,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: reversedRow ? widgets.reversed.toList() : widgets,
          ),
        ),
      ),
    );
  }

  @override
  NativeWidgetViewModel viewModelBuilder(BuildContext context) =>
      NativeWidgetViewModel();
}
