import 'package:dini_atlas/models/favourite.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/favourites/widgets/create_folder.dart';
import 'package:dini_atlas/ui/views/favourites/widgets/favourite_contents.dart';
import 'package:dini_atlas/ui/views/favourites/widgets/favourite_folder_list.dart';
import 'package:dini_atlas/ui/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import 'favourites_viewmodel.dart';

class FavouritesView extends StackedView<FavouritesViewModel> {
  const FavouritesView({super.key, this.favourite});
  final Favourite? favourite;

  @override
  Widget builder(
    BuildContext context,
    FavouritesViewModel viewModel,
    Widget? child,
  ) {
    final isFolderPage = viewModel.showFolder == null;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBarWidget(
        title: !isFolderPage
            ? viewModel.showFolder!
            : favourite != null
                ? "Klasör Seçin"
                : "Favoriler",
        hideBackButton: true,
        leading: IconButton(
            onPressed: () {
              // Eğer klasör açılmamışsa sayfayı kapat
              if (isFolderPage) {
                Navigator.of(context).pop();
              } else {
                // Klasör açılmışsa klasörlere dön
                viewModel.showFolder = null;
              }
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Column(
          children: [
            if (favourite != null)
              CreateFavouriteFolderWidget(viewModel: viewModel),
            verticalSpaceSmall,
            isFolderPage
                ? FavouriteFolderListView(
                    viewModel: viewModel, favourite: favourite)
                : FavouriteContentsWidget(viewModel: viewModel),
          ],
        ),
      ),
    );
  }

  @override
  FavouritesViewModel viewModelBuilder(BuildContext context) =>
      FavouritesViewModel();

  @override
  void onViewModelReady(FavouritesViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}
