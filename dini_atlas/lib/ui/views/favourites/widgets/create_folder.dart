import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/views/favourites/favourites_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateFavouriteFolderWidget extends StatelessWidget {
  const CreateFavouriteFolderWidget({super.key, required this.viewModel});
  final FavouritesViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    if (viewModel.createFolder) {
      return const SizedBox();
    } else {
      return Align(
        alignment: Alignment.centerLeft,
        child: _createFolderButton(viewModel),
      );
    }
  }

  Widget _createFolderButton(FavouritesViewModel viewModel) {
    return TextButton.icon(
      onPressed: () => viewModel.createFolder = true,
      icon: SvgPicture.asset(kiFolderPlus),
      label: const Text(
        "Klasör oluştur",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: kcPrimaryColor,
        ),
      ),
    );
  }
}
