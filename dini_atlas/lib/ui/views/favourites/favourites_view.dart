import 'package:dini_atlas/models/favourite.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/favourites/widgets/create_folder.dart';
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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBarWidget(
        title: favourite != null ? "Klasör Seçin" : "Favoriler",
        actions: [
          IconButton(onPressed: () {}, icon: SvgPicture.asset(kiSearch))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Column(
          children: [
            if (favourite != null)
              CreateFavouriteFolderWidget(viewModel: viewModel),
            verticalSpaceSmall,
            FavouriteFolderListView(viewModel: viewModel, favourite: favourite),
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
