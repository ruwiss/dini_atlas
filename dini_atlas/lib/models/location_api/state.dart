import 'package:isar/isar.dart';

part 'state.g.dart';

@embedded
class StateModel {
  late String ilceAdi;
  late String ilceAdiEn;
  late String ilceId;

  StateModel();

  StateModel.fromJson(Map<String, dynamic> json)
      : ilceAdi = (json["IlceAdi"] as String).toLowerCase(),
        ilceAdiEn = (json["IlceAdiEn"] as String).toLowerCase(),
        ilceId = (json["IlceID"] as String).toLowerCase();

  Map<String, dynamic> toJson() => {
        "IlceAdi": ilceAdi,
        "IlceAdiEn": ilceAdiEn,
        "IlceID": ilceId,
      };
}
