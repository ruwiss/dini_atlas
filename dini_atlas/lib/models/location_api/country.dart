import 'package:dini_atlas/extensions/string_extensions.dart';
import 'package:isar/isar.dart';

part 'country.g.dart';

@embedded
class Country {
  late String ulkeAdi;
  late String ulkeAdiEn;
  late String ulkeId;

  Country();

  Country.fromJson(Map<String, dynamic> json)
      : ulkeAdi = (json["UlkeAdi"] as String).toLowerCaseTurkish(),
        ulkeAdiEn = (json["UlkeAdiEn"] as String).toLowerCaseTurkish(),
        ulkeId = (json["UlkeID"] as String);

  Map<String, dynamic> toJson() => {
        "UlkeAdi": ulkeAdi,
        "UlkeAdiEn": ulkeAdiEn,
        "UlkeID": ulkeId,
      };
}
