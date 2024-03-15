class DailyContents {
  final DailyContent ayet;
  final DailyContent hadis;
  final DailyContent dua;

  DailyContents(this.ayet, this.hadis, this.dua);

  DailyContents.fromJson(Map<String, dynamic> json)
      : ayet = DailyContent.fromJson(json['ayet'], DailyContentType.ayet),
        hadis = DailyContent.fromJson(json['hadis'], DailyContentType.hadis),
        dua = DailyContent.fromJson(json['dua'], DailyContentType.dua);
}

enum DailyContentType { ayet, hadis, dua }

class DailyContent {
  final DailyContentType dailyContentType;
  final String metin;
  final String kaynak;
  DailyContent(this.metin, this.kaynak, this.dailyContentType);

  DailyContent.fromJson(Map<String, dynamic> json, DailyContentType type)
      : metin = json['metin'],
        kaynak = json['kaynak'],
        dailyContentType = type;
}
