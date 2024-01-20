import 'package:isar/isar.dart';
part 'city.g.dart';

@embedded
class City {
  late String sehirAdi;
  late String sehirAdiEn;
  late String sehirId;

  City();

  City.fromJson(Map<String, dynamic> json)
      : sehirAdi = (json["SehirAdi"] as String).toLowerCase(),
        sehirAdiEn = (json["SehirAdiEn"] as String).toLowerCase(),
        sehirId = (json["SehirID"] as String).toLowerCase();

  Map<String, dynamic> toJson() => {
        "SehirAdi": sehirAdi,
        "SehirAdiEn": sehirAdiEn,
        "SehirID": sehirId,
      };
}
