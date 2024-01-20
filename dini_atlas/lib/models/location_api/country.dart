import 'package:isar/isar.dart';

part 'country.g.dart';

@embedded
class Country {
  late String ulkeAdi;
  late String ulkeAdiEn;
  late String ulkeId;

  Country();

  Country.fromJson(Map<String, dynamic> json)
      : ulkeAdi = (json["UlkeAdi"] as String).toLowerCase(),
        ulkeAdiEn = (json["UlkeAdiEn"] as String).toLowerCase(),
        ulkeId = (json["UlkeID"] as String).toLowerCase();

  Map<String, dynamic> toJson() => {
        "UlkeAdi": ulkeAdi,
        "UlkeAdiEn": ulkeAdiEn,
        "UlkeID": ulkeId,
      };
}
