import 'package:isar/isar.dart';
import 'dart:convert';

part 'user_setting.g.dart';

@collection
class UserSetting {
  late Id id;
  late String jsonString;

  Map<String, dynamic> jsonValue() => jsonDecode(jsonString);
}
