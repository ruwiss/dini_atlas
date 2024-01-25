import 'package:dini_atlas/models/location_api/city.dart';
import 'package:dini_atlas/models/location_api/country.dart';
import 'package:dini_atlas/models/location_api/state.dart';
import 'package:isar/isar.dart';
import 'dart:convert';

part 'user_setting.g.dart';

@collection
class UserSetting {
  Id id = Isar.autoIncrement;
  late String jsonString;
  Country? country;
  City? city;
  StateModel? state;

  Map<String, dynamic> jsonValue() => jsonDecode(jsonString);
}
