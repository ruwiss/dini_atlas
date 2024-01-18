import 'dart:convert';

import 'package:isar/isar.dart';

part 'user_setting.g.dart';

@collection
class UserSetting {
  Id id = Isar.autoIncrement;
  late String key;
  late String jsonString;

  Map<String, dynamic> jsonValue() => jsonDecode(jsonString);
}
