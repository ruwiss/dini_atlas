import 'package:dini_atlas/extensions/string_extensions.dart';
import 'package:dini_atlas/models/content_type.dart';
import 'package:dini_atlas/models/favourite.dart';
import 'package:dini_atlas/ui/views/favourites/favourites_viewmodel.dart';
import 'package:dini_atlas/ui/widgets/content_widget.dart';
import 'package:flutter/material.dart';

class FavouriteContentsWidget extends StatelessWidget {
  const FavouriteContentsWidget({super.key, required this.viewModel});
  final FavouritesViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: viewModel.getFavouritesCurrentFolder!.length,
        itemBuilder: (context, index) {
          final Favourite item = viewModel.getFavouritesCurrentFolder![index];
          late final ContentTypes type;
          if (item.type == "ayet") {
            type = ContentTypes.ayahTypeFavorite();
          } else if (item.type == "hadis") {
            type = ContentTypes.hadithTypeFavorite();
          }
          return ContentWidget(
            type: type,
            titleText: type.type.name.capitalize(),
            number: item.number,
            text1: item.text1,
            text2: item.text2,
            text3: item.text3,
            isSaved: true,
            onBookmarkTap: () => viewModel.onFavouriteItemDelete(item),
          );
        },
      ),
    );
  }
}
