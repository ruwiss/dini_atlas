import 'package:dini_atlas/models/user_setting/user_setting.dart';
import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';

class IsarService {
  late Isar isar;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [UserSettingSchema],
      directory: dir.path,
    );
  }
}
