import 'dart:convert';

import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/app/app.router.dart';
import 'package:dini_atlas/models/content_type.dart';
import 'package:dini_atlas/models/favourite.dart';
import 'package:dini_atlas/services/local/favorites_service.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FortyHadithsViewModel extends BaseViewModel {
  final _favouritesService = locator<FavouritesService>();
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();

  final _name = "40 Hadis";

  List<Favourite>? _favourites;
  List<Favourite>? get favourites => _favourites;

  void init() {
    runBusyFuture(_getFavourites());
  }

  Future<List<HadithModel>> getFortyHadiths() async {
    final dataString = await rootBundle.loadString('assets/docs/40_hadis.json');
    final List dataList = jsonDecode(dataString);

    return dataList.map((e) => HadithModel.fromJson(e)).toList();
  }

  Future<void> _getFavourites() async {
    _favourites = await _favouritesService.getFavourites();
    notifyListeners();
  }

  bool isInFavourites(int id) =>
      favourites?.any((e) => e.number == id && e.name == _name) ?? false;

  void toggleFavorite(HadithModel hadith) async {
    if (isInFavourites(hadith.id)) {
      final favHadith = favourites!
          .singleWhere((e) => e.number == hadith.id && e.name == _name);
      await _favouritesService.deleteFavourite(id: favHadith.id, name: _name);
      await _getFavourites();
    } else {
      // Nesne oluştur
      final fav = Favourite()
        ..name = _name
        ..text1 = hadith.arabic
        ..text3 = hadith.turkish
        ..number = hadith.id
        ..type = EContentTypes.hadis.name;

      // Klasör seçmesi için favoriler ekranına gönder
      final result =
          await _navigationService.navigateToFavouritesView(favourite: fav);

      // Klasör seçimi sonrası gelen klasör ismiyle kayıt oluştur
      if (result is String) {
        await _favouritesService.addFavourite(fav..folder = result);
        _bottomSheetService.showBottomSheet(
          title: "Hadis favorilere eklendi.",
          description: "$result isimli klasöre kaydedildi.",
          confirmButtonTitle: "Tamam",
        );
        _getFavourites();
      }
    }
  }
}

class HadithModel {
  final int id;
  final String arabic;
  final String turkish;

  HadithModel(this.id, this.arabic, this.turkish);

  HadithModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        arabic = json['arabic'],
        turkish = json['turkish'];
}
