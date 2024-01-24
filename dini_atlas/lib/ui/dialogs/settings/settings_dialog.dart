import 'package:dini_atlas/ui/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'settings_dialog_model.dart';

class SettingsDialog extends StackedView<SettingsDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const SettingsDialog({
    super.key,
    required this.request,
    required this.completer,
  });

  @override
  Widget builder(
    BuildContext context,
    SettingsDialogModel viewModel,
    Widget? child,
  ) {
    final List<Widget> data = request.data ?? [];
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: kcBackgroundColor,
      surfaceTintColor: kcBackgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _headerWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: data,
            ),
          )
        ],
      ),
    );
  }

  Container _headerWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: kcGrayColorLightSoft,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.settings,
            size: 30,
            color: kcGrayColorSoft,
          ),
          horizontalSpace(24),
          Text(
            request.title ?? "Ayarlar",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: kcGrayColorSoft,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () => completer(DialogResponse(confirmed: false)),
            icon: const Icon(
              Icons.close,
              size: 33,
              color: kcGrayColorSoft,
            ),
          )
        ],
      ),
    );
  }

  @override
  SettingsDialogModel viewModelBuilder(BuildContext context) =>
      SettingsDialogModel();
}
