class EidPrayer {
  final EidPrayerTime bayramNamazVakti;
  final StateInfo ilceBilgisi;

  EidPrayer({
    required this.bayramNamazVakti,
    required this.ilceBilgisi,
  });

  factory EidPrayer.fromJson(Map<String, dynamic> json) => EidPrayer(
        bayramNamazVakti: EidPrayerTime.fromJson(json["bayramNamazVakti"]),
        ilceBilgisi: StateInfo.fromJson(json["ilceBilgisi"]),
      );

  Map<String, dynamic> toJson() => {
        "bayramNamazVakti": bayramNamazVakti.toJson(),
        "ilceBilgisi": ilceBilgisi.toJson(),
      };
}

class EidPrayerTime {
  final String kurbanBayramNamaziHTarihi;
  final String kurbanBayramNamaziSaati;
  final String kurbanBayramNamaziTarihi;
  final String ramazanBayramNamaziHTarihi;
  final String ramazanBayramNamaziSaati;
  final String ramazanBayramNamaziTarihi;

  EidPrayerTime({
    required this.kurbanBayramNamaziHTarihi,
    required this.kurbanBayramNamaziSaati,
    required this.kurbanBayramNamaziTarihi,
    required this.ramazanBayramNamaziHTarihi,
    required this.ramazanBayramNamaziSaati,
    required this.ramazanBayramNamaziTarihi,
  });

  factory EidPrayerTime.fromJson(Map<String, dynamic> json) =>
      EidPrayerTime(
        kurbanBayramNamaziHTarihi: json["KurbanBayramNamaziHTarihi"],
        kurbanBayramNamaziSaati: json["KurbanBayramNamaziSaati"],
        kurbanBayramNamaziTarihi: json["KurbanBayramNamaziTarihi"],
        ramazanBayramNamaziHTarihi: json["RamazanBayramNamaziHTarihi"],
        ramazanBayramNamaziSaati: json["RamazanBayramNamaziSaati"],
        ramazanBayramNamaziTarihi: json["RamazanBayramNamaziTarihi"],
      );

  Map<String, dynamic> toJson() => {
        "KurbanBayramNamaziHTarihi": kurbanBayramNamaziHTarihi,
        "KurbanBayramNamaziSaati": kurbanBayramNamaziSaati,
        "KurbanBayramNamaziTarihi": kurbanBayramNamaziTarihi,
        "RamazanBayramNamaziHTarihi": ramazanBayramNamaziHTarihi,
        "RamazanBayramNamaziSaati": ramazanBayramNamaziSaati,
        "RamazanBayramNamaziTarihi": ramazanBayramNamaziTarihi,
      };
}

class StateInfo {
  final String cografiKibleAcisi;
  final String ilceAdi;
  final dynamic ilceAdiEn;
  final String ilceId;
  final String kabeyeUzaklik;
  final String kibleAcisi;
  final String sehirAdi;
  final dynamic sehirAdiEn;
  final String ulkeAdi;
  final dynamic ulkeAdiEn;

  StateInfo({
    required this.cografiKibleAcisi,
    required this.ilceAdi,
    required this.ilceAdiEn,
    required this.ilceId,
    required this.kabeyeUzaklik,
    required this.kibleAcisi,
    required this.sehirAdi,
    required this.sehirAdiEn,
    required this.ulkeAdi,
    required this.ulkeAdiEn,
  });

  factory StateInfo.fromJson(Map<String, dynamic> json) => StateInfo(
        cografiKibleAcisi: json["CografiKibleAcisi"],
        ilceAdi: json["IlceAdi"],
        ilceAdiEn: json["IlceAdiEn"],
        ilceId: json["IlceID"],
        kabeyeUzaklik: json["KabeyeUzaklik"],
        kibleAcisi: json["KibleAcisi"],
        sehirAdi: json["SehirAdi"],
        sehirAdiEn: json["SehirAdiEn"],
        ulkeAdi: json["UlkeAdi"],
        ulkeAdiEn: json["UlkeAdiEn"],
      );

  Map<String, dynamic> toJson() => {
        "CografiKibleAcisi": cografiKibleAcisi,
        "IlceAdi": ilceAdi,
        "IlceAdiEn": ilceAdiEn,
        "IlceID": ilceId,
        "KabeyeUzaklik": kabeyeUzaklik,
        "KibleAcisi": kibleAcisi,
        "SehirAdi": sehirAdi,
        "SehirAdiEn": sehirAdiEn,
        "UlkeAdi": ulkeAdi,
        "UlkeAdiEn": ulkeAdiEn,
      };
}
