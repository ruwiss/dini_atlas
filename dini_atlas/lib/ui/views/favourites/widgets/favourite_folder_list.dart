import 'package:dini_atlas/models/favourite.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/favourites/favourites_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'no_favourite.dart';

class FavouriteFolderListView extends StatelessWidget {
  const FavouriteFolderListView(
      {super.key, required this.viewModel, this.favourite});
  final FavouritesViewModel viewModel;
  final Favourite? favourite;

  @override
  Widget build(BuildContext context) {
    if (viewModel.isBusy) {
      return const SizedBox();
    } else if (viewModel.favourites!.isEmpty &&
        !viewModel.createFolder &&
        favourite == null) {
      return const NoFavouriteWidget();
    } else {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Column(
            children: [
              if (viewModel.createFolder)
                _favouriteItem(
                    viewModel: viewModel,
                    item: Favourite(),
                    isCreateFolder: true),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: viewModel.getUniqueFavouritesList().length,
                  itemBuilder: (context, index) {
                    final item = viewModel.getUniqueFavouritesList()[index];
                    return InkWell(
                      splashFactory: NoSplash.splashFactory,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        if (favourite != null) {
                          // Klasör seçimi (Kayıt için)
                          viewModel.onFolderSelectForSave(item);
                        } else {
                          // İçeriği göster
                          viewModel.showFolder = item.folder;
                        }
                      },
                      child: _favouriteItem(viewModel: viewModel, item: item),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget _favouriteItem({
    required FavouritesViewModel viewModel,
    required Favourite item,
    bool isCreateFolder = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: isCreateFolder
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(kiFolder2),
          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                !isCreateFolder
                    ? Text(
                        item.folder,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: kcPrimaryColorDark,
                        ),
                      )
                    : TextField(
                        controller: viewModel.createFolderInputCtrl,
                        autofocus: true,
                        textInputAction: TextInputAction.go,
                        onSubmitted: (_) => viewModel.onCreateFolderButtonTap(),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          hintText: "Klasör ismi",
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: kcGrayColor.withOpacity(.6),
                          ),
                        ),
                      ),
                if (!isCreateFolder) verticalSpace(4),
                Text(
                  isCreateFolder
                      ? "0 kayıt"
                      : "${viewModel.getItemCountByFolder(item.folder)} kayıt",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          !isCreateFolder
              ? PopupMenuButton(
                  child: SvgPicture.asset(kiMore),
                  onSelected: (value) {
                    if (value == "delete") {
                      viewModel.onFolderDelete(item);
                    }
                  },
                  itemBuilder: (context) => <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: "delete",
                      child: Text('Klasörü Sil'),
                    ),
                  ],
                )
              : InkWell(
                  borderRadius: BorderRadius.circular(5),
                  onTap: () => viewModel.onCreateFolderButtonTap(),
                  child: const Icon(
                    Icons.check,
                    color: kcPrimaryColor,
                    size: 26,
                  ),
                ),
        ],
      ),
    );
  }
}
