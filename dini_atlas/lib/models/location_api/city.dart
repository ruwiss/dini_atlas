import 'package:dini_atlas/extensions/string_extensions.dart';
import 'package:isar/isar.dart';
part 'city.g.dart';

@embedded
class City {
  late String sehirAdi;
  late String sehirAdiEn;
  late String sehirId;

  City();

  City.fromJson(Map<String, dynamic> json)
      : sehirAdi = (json["SehirAdi"] as String).toLowerCaseTurkish(),
        sehirAdiEn = (json["SehirAdiEn"] as String).toLowerCaseTurkish(),
        sehirId = (json["SehirID"] as String);

  Map<String, dynamic> toJson() => {
        "SehirAdi": sehirAdi,
        "SehirAdiEn": sehirAdiEn,
        "SehirID": sehirId,
      };
}
