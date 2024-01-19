class StateModel {
    final String ilceAdi;
    final String ilceAdiEn;
    final String ilceId;

    StateModel({
        required this.ilceAdi,
        required this.ilceAdiEn,
        required this.ilceId,
    });

    factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
        ilceAdi: json["IlceAdi"],
        ilceAdiEn: json["IlceAdiEn"],
        ilceId: json["IlceID"],
    );

    Map<String, dynamic> toJson() => {
        "IlceAdi": ilceAdi,
        "IlceAdiEn": ilceAdiEn,
        "IlceID": ilceId,
    };
}
