class Kaza {
  final int sabah;
  final int ogle;
  final int ikindi;
  final int aksam;
  final int yatsi;
  final int vitir;
  final int oruc;
  final DateTime? lastUpdated;

  Kaza({
    required this.sabah,
    required this.ogle,
    required this.ikindi,
    required this.aksam,
    required this.yatsi,
    required this.vitir,
    required this.oruc,
    this.lastUpdated,
  });

  Kaza.fromJson(Map<String, dynamic> json)
      : sabah = json["sabah"],
        ogle = json["ogle"],
        ikindi = json["ikindi"],
        aksam = json["aksam"],
        yatsi = json["yatsi"],
        vitir = json["vitir"],
        oruc = json["oruc"],
        lastUpdated = DateTime.parse(json["lastUpdated"]);

  Map<String, dynamic> toJson() => {
        "sabah": sabah,
        "ogle": ogle,
        "ikindi": ikindi,
        "aksam": aksam,
        "yatsi": yatsi,
        "vitir": vitir,
        "oruc": oruc,
        "lastUpdated": lastUpdated?.toIso8601String(),
      };

  Kaza.createEmpty()
      : sabah = 100,
        ogle = 100,
        ikindi = 100,
        aksam = 100,
        yatsi = 100,
        vitir = 100,
        oruc = 0,
        lastUpdated = null;
}
