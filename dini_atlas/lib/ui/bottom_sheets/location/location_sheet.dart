import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'location_sheet_model.dart';

class LocationSheet extends StackedView<LocationSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const LocationSheet({
    super.key,
    required this.completer,
    required this.request,
  });

  List<String> get _listItems => request.data as List<String>;

  @override
  Widget builder(
    BuildContext context,
    LocationSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
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
          Text(
            request.title ?? 'Seçim Yapınız',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          if (request.description != null) ...[
            verticalSpaceTiny,
            Text(
              request.description!,
              style: const TextStyle(fontSize: 14, color: kcGrayColor),
              maxLines: 3,
              softWrap: true,
            ),
          ],
          verticalSpaceMedium,
          TextField(
            onChanged: viewModel.filter,
            autofocus: true,
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: kcBlueGrayColor.withOpacity(.8),
              hintText: "Arama Yap",
              border: InputBorder.none,
            ),
          ),
          verticalSpaceMedium,
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: viewModel.filteredList.length,
              itemBuilder: (context, index) {
                final String item = viewModel.filteredList[index];
                return ListTile(
                  title: Text(
                    item,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: kcGrayColor,
                    ),
                  ),
                  onTap: () =>
                      completer!(SheetResponse(confirmed: true, data: item)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  LocationSheetModel viewModelBuilder(BuildContext context) =>
      LocationSheetModel(listItems: _listItems);
}
