import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/models/favourite.dart';
import 'package:dini_atlas/services/local/favorites_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FavouritesViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _favouritesService = locator<FavouritesService>();

  List<Favourite>? _favourites;
  List<Favourite>? get favourites => _favourites;

  // Tekrarlayan klasörleri filtrele
  List<Favourite> getUniqueFavouritesList() {
    Set<String> uniqueFolders = {};
    List<Favourite> uniqueList = [];

    for (Favourite model in favourites!) {
      if (!uniqueFolders.contains(model.folder)) {
        uniqueFolders.add(model.folder);
        uniqueList.add(model);
      }
    }
    return uniqueList;
  }

  final _createFolderInputCtrl = TextEditingController();
  TextEditingController get createFolderInputCtrl => _createFolderInputCtrl;

  bool _createFolder = false;
  bool get createFolder => _createFolder;
  set createFolder(bool value) {
    _createFolder = value;
    notifyListeners();
  }

  void init() async {
    runBusyFuture(getFavourites());
  }

  Future<void> getFavourites() async {
    _favourites = await _favouritesService.getFavourites();
    notifyListeners();
  }

  int getItemCountByFolder(String folder) =>
      favourites!.where((e) => e.folder == folder).length;

  void onCreateFolderButtonTap(Favourite favourite) async {
    final folderName = createFolderInputCtrl.text.trim();
    if (folderName.isEmpty) return;
    favourite.folder = folderName;
    await _favouritesService.addFavourite(favourite);
    _navigationService.back();
    _bottomSheetService.showBottomSheet(
      title: "Favorilere eklendi.",
      description: "$folderName isimli klasöre kaydedildi.",
      confirmButtonTitle: "Tamam",
    );
  }

  void onFolderSelectForSave(Favourite favourite) async {
    _navigationService.back(result: favourite.folder);
  }
}
