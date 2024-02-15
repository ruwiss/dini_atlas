import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/app/app.router.dart';
import 'package:dini_atlas/models/content_type.dart';
import 'package:dini_atlas/models/favourite.dart';
import 'package:dini_atlas/services/local/favorites_service.dart';
import 'package:dini_atlas/services/local/network_checker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'dualar_service.dart';

class DualarViewModel extends BaseViewModel {
  final _networkChecker = locator<NetworkChecker>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();
  final _favouritesService = locator<FavouritesService>();

  final _dualarService = DualarService.instance;

  late List<Favourite> _favourites;
  List<Favourite> get favourites => _favourites;
  bool isInFavourites(String text) => favourites.any((e) => e.name == text);

  void init() {
    runBusyFuture(_getFavourites());
  }

  Future<void> _getFavourites() async {
    _favourites = await _favouritesService.getFavourites();
    notifyListeners();
  }

  Future<List?> getDailyPrayers() async {
    final result = await _dualarService.fetchDailyPrayers();
    return result.fold(
      (list) => list = list,
      (err) => Future.error(err.message),
    );
  }

  void toggleFavorite(String text, int number) async {
    if (isInFavourites(text)) {
      final fav = favourites.singleWhere((e) => e.name == text);
      await _favouritesService.deleteFavourite(id: fav.id, name: text);
      await _getFavourites();
    } else {
      // Nesne oluştur
      final fav = Favourite()
        ..name = text
        ..text3 = text
        ..number = number
        ..type = EContentTypes.dua.name;

      // Klasör seçmesi için favoriler ekranına gönder
      final result =
          await _navigationService.navigateToFavouritesView(favourite: fav);

      // Klasör seçimi sonrası gelen klasör ismiyle kayıt oluştur
      if (result is String) {
        await _favouritesService.addFavourite(fav..folder = result);
        _bottomSheetService.showBottomSheet(
          title: "Dua favorilere eklendi.",
          description: "$result isimli klasöre kaydedildi.",
          confirmButtonTitle: "Tamam",
        );
        _getFavourites();
      }
    }
  }

  @override
  void dispose() {
    _networkChecker.dispose();
    super.dispose();
  }
}
