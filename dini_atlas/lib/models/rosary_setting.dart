import 'package:isar/isar.dart';

part 'rosary_setting.g.dart';

@collection
class RosarySetting {
  Id id = Isar.autoIncrement;

  bool darkMode = false;

  int count = 0;
  int limit = 33;
  int setCount = 1;

  bool vibrate = true;
  bool sound = true;
}
