class AyahList {
  List<AyahModel> ayetler;
  final SuraDetailedInfo sure;

  AyahList({
    required this.ayetler,
    required this.sure,
  });

  factory AyahList.fromJson(Map<String, dynamic> json) => AyahList(
        ayetler: List<AyahModel>.from(
            json["ayetler"].map((x) => AyahModel.fromJson(x))),
        sure: SuraDetailedInfo.fromJson(json["sure"]),
      );

  Map<String, dynamic> toJson() => {
        "ayetler": List<dynamic>.from(ayetler.map((x) => x.toJson())),
        "sure": sure.toJson(),
      };
}

class AyahModel {
  /// Ayet numarası
  final int ayet;

  /// Sure numarası
  final int sure;

  /// Türkçe meali
  final String text;

  /// Arapça metin
  final String textAr;

  /// Arapça metin Türkçe okunuşu
  final String textOkunus;

  AyahModel({
    required this.ayet,
    required this.sure,
    required this.text,
    required this.textAr,
    required this.textOkunus,
  });

  factory AyahModel.fromJson(Map<String, dynamic> json) => AyahModel(
        ayet: json["ayet"],
        sure: json["sure"],
        text: json["text"],
        textAr: json["text_ar"],
        textOkunus: json["text_okunus"],
      );

  Map<String, dynamic> toJson() => {
        "ayet": ayet,
        "sure": sure,
        "text": text,
        "text_ar": textAr,
        "text_okunus": textOkunus,
      };
}

class SuraDetailedInfo {
  final String aciklama;
  final int ayetSayisi;
  final int cuz;
  final String isim;
  final String isimAr;
  final int sayfa;
  final int sure;
  final String yer;

  SuraDetailedInfo({
    required this.aciklama,
    required this.ayetSayisi,
    required this.cuz,
    required this.isim,
    required this.isimAr,
    required this.sayfa,
    required this.sure,
    required this.yer,
  });

  factory SuraDetailedInfo.fromJson(Map<String, dynamic> json) =>
      SuraDetailedInfo(
        aciklama: json["aciklama"],
        ayetSayisi: json["ayet_sayisi"],
        cuz: json["cuz"],
        isim: json["isim"],
        isimAr: json["isim_ar"],
        sayfa: json["sayfa"],
        sure: json["sure"],
        yer: json["yer"],
      );

  Map<String, dynamic> toJson() => {
        "aciklama": aciklama,
        "ayet_sayisi": ayetSayisi,
        "cuz": cuz,
        "isim": isim,
        "isim_ar": isimAr,
        "sayfa": sayfa,
        "sure": sure,
        "yer": yer,
      };
}
