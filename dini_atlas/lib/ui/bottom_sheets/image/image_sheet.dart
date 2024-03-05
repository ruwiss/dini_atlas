import 'package:flutter/material.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'image_sheet_model.dart';

class ImageSheet extends StackedView<ImageSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const ImageSheet({
    super.key,
    required this.completer,
    required this.request,
  });

  @override
  Widget builder(
    BuildContext context,
    ImageSheetModel viewModel,
    Widget? child,
  ) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (request.title case final String title)
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                if (request.data['button'] case final ElevatedButton button)
                  button
              ],
            ),
            if (request.description case final String description) ...[
              verticalSpaceTiny,
              Text(
                description,
                style: const TextStyle(fontSize: 14),
                maxLines: 3,
                softWrap: true,
              ),
              verticalSpaceTiny
            ],
            if (request.data['image'] case final Widget widget) widget,
          ],
        ),
      ),
    );
  }

  @override
  ImageSheetModel viewModelBuilder(BuildContext context) => ImageSheetModel();
}
