import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/models/favourite.dart';
import 'package:dini_atlas/services/local/favorites_service.dart';
import 'package:dini_atlas/services/remote/google/admob_service.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FavouritesViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _favouritesService = locator<FavouritesService>();

  final _bannerAd = AdmobBannerAdService(adUnitId: ksAdmobBanner2);
  BannerAd? get bannerAd => _bannerAd.bannerAd;
  void _loadBannerAd() => _bannerAd.loadAd(onAdLoaded: () => notifyListeners());

  List<Favourite>? _favourites;
  List<Favourite>? get favourites => _favourites;
  List<Favourite>? get getFavouritesCurrentFolder => _favourites
      ?.where((e) => e.folder == showFolder)
      .toList()
      .reversed
      .toList();

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

  String? _showFolder;
  String? get showFolder => _showFolder;
  set showFolder(String? value) {
    _showFolder = value;
    notifyListeners();
  }

  void init() async {
    _loadBannerAd();
    runBusyFuture(_getFavourites());
  }

  Future<void> _getFavourites() async {
    _favourites = await _favouritesService.getFavourites();
    notifyListeners();
  }

  int getItemCountByFolder(String folder) =>
      favourites!.where((e) => e.folder == folder).length;

  void onCreateFolderButtonTap() async {
    final folderName = createFolderInputCtrl.text.trim();
    if (folderName.isEmpty) return;
    _navigationService.back(result: folderName);
  }

  void onFolderSelectForSave(Favourite favourite) async {
    _navigationService.back(result: favourite.folder);
  }

  void onFolderDelete(Favourite favourite) async {
    await _favouritesService.deleteFolder(favourite.folder);
    await _getFavourites();
  }

  void onFavouriteItemDelete(Favourite item) async {
    await _favouritesService.deleteFavourite(id: item.id, name: item.name);
    _favourites!.removeWhere((e) => e == item);
    notifyListeners();
    if (_favourites!.isEmpty) showFolder = null;
  }
}
