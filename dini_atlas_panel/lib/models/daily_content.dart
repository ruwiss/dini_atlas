class DailyContents {
  final DailyContent ayet;
  final DailyContent hadis;
  final DailyContent dua;

  DailyContents(this.ayet, this.hadis, this.dua);

  DailyContents.fromJson(Map<String, dynamic> json)
      : ayet = DailyContent.fromJson(json['ayet'], DailyContentType.ayet),
        hadis = DailyContent.fromJson(json['hadis'], DailyContentType.hadis),
        dua = DailyContent.fromJson(json['dua'], DailyContentType.dua);

  Map<String, dynamic> toJson() => {
        "ayet": ayet.toJson(),
        "hadis": hadis.toJson(),
        "dua": dua.toJson(),
      };
  DailyContents.empty()
      : ayet = DailyContent.empty(DailyContentType.ayet),
        hadis = DailyContent.empty(DailyContentType.hadis),
        dua = DailyContent.empty(DailyContentType.dua);
}

enum DailyContentType { ayet, hadis, dua }

class DailyContent {
  final DailyContentType dailyContentType;
  String metin;
  String kaynak;
  DailyContent(this.metin, this.kaynak, this.dailyContentType);

  DailyContent.empty(DailyContentType type)
      : dailyContentType = type,
        metin = "",
        kaynak = "";

  DailyContent.fromJson(Map<String, dynamic> json, DailyContentType type)
      : metin = json['metin'],
        kaynak = json['kaynak'],
        dailyContentType = type;

  Map<String, dynamic> toJson() => {
        "metin": metin,
        "kaynak": kaynak,
      };
}
