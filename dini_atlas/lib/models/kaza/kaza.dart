class Kaza {
  int sabah;
  int ogle;
  int ikindi;
  int aksam;
  int yatsi;
  int vitir;
  int oruc;
  DateTime? lastUpdated;

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
      : sabah = json['sabah'],
        ogle = json['ogle'],
        ikindi = json['ikindi'],
        aksam = json['aksam'],
        yatsi = json['yatsi'],
        vitir = json['vitir'],
        oruc = json['oruc'],
        lastUpdated = json['lastUpdated'] == null
            ? null
            : DateTime.parse(json['lastUpdated']);

  Map<String, dynamic> toJson() => {
        'sabah': sabah,
        'ogle': ogle,
        'ikindi': ikindi,
        'aksam': aksam,
        'yatsi': yatsi,
        'vitir': vitir,
        'oruc': oruc,
        'lastUpdated': lastUpdated?.toIso8601String(),
      };

  Kaza.createEmpty()
      : sabah = 0,
        ogle = 0,
        ikindi = 0,
        aksam = 0,
        yatsi = 0,
        vitir = 0,
        oruc = 0,
        lastUpdated = null;

  Kaza copyWith({
    int? sabah,
    int? ogle,
    int? ikindi,
    int? aksam,
    int? yatsi,
    int? vitir,
    int? oruc,
    DateTime? lastUpdated,
  }) {
    int? valueChecker(int? value) => value == null
        ? null
        : value.isNegative
            ? 0
            : value;
    return Kaza(
      sabah: valueChecker(sabah) ?? this.sabah,
      ogle: valueChecker(ogle) ?? this.ogle,
      ikindi: valueChecker(ikindi) ?? this.ikindi,
      aksam: valueChecker(aksam) ?? this.aksam,
      yatsi: valueChecker(yatsi) ?? this.yatsi,
      vitir: valueChecker(vitir) ?? this.vitir,
      oruc: valueChecker(oruc) ?? this.oruc,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}
