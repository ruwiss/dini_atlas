import 'package:dini_atlas/extensions/string_extensions.dart';
import 'package:isar/isar.dart';

part 'state.g.dart';

@embedded
class StateModel {
  late String ilceAdi;
  late String ilceAdiEn;
  late String ilceId;

  StateModel();

  StateModel.fromJson(Map<String, dynamic> json)
      : ilceAdi = (json["IlceAdi"] as String).toLowerCaseTurkish(),
        ilceAdiEn = (json["IlceAdiEn"] as String).toLowerCaseTurkish(),
        ilceId = (json["IlceID"] as String);

  Map<String, dynamic> toJson() => {
        "IlceAdi": ilceAdi,
        "IlceAdiEn": ilceAdiEn,
        "IlceID": ilceId,
      };
}
