import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/models/favourite.dart';
import 'package:isar/isar.dart';

import 'isar_service.dart';

class FavouritesService {
  final _db = locator<IsarService>();
  IsarCollection<Favourite> get _favourites => _db.isar.favourites;

  Future<void> addFavourite(Favourite favourite) async {
    await _db.isar.writeTxn(() async => await _favourites.put(favourite));
  }

  Future<void> deleteFavourite(int id) async {
    await _db.isar.writeTxn(() async => await _favourites.delete(id));
  }

  Future<void> deleteFolder(String folder) async {
    await _db.isar.writeTxn(() async =>
        await _favourites.where().filter().folderEqualTo(folder).deleteAll());
  }

  Future<List<Favourite>> getFavourites({String? folder}) async {
    if (folder case final String folder) {
      return await _favourites.where().filter().folderEqualTo(folder).findAll();
    } else {
      return await _favourites.where().findAll();
    }
  }
}
