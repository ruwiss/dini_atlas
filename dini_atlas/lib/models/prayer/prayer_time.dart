class PrayerTime {
  final String aksam;
  final String ayinSekliUrl;
  final int greenwichOrtalamaZamani;
  final String gunes;
  final String gunesBatis;
  final String gunesDogus;
  final String hicriTarihKisa;
  final dynamic hicriTarihKisaIso8601;
  final String hicriTarihUzun;
  final dynamic hicriTarihUzunIso8601;
  final String ikindi;
  final String imsak;
  final String kibleSaati;
  final String miladiTarihKisa;
  final String miladiTarihKisaIso8601;
  final String miladiTarihUzun;
  final DateTime miladiTarihUzunIso8601;
  final String ogle;
  final String yatsi;

  PrayerTime({
    required this.aksam,
    required this.ayinSekliUrl,
    required this.greenwichOrtalamaZamani,
    required this.gunes,
    required this.gunesBatis,
    required this.gunesDogus,
    required this.hicriTarihKisa,
    required this.hicriTarihKisaIso8601,
    required this.hicriTarihUzun,
    required this.hicriTarihUzunIso8601,
    required this.ikindi,
    required this.imsak,
    required this.kibleSaati,
    required this.miladiTarihKisa,
    required this.miladiTarihKisaIso8601,
    required this.miladiTarihUzun,
    required this.miladiTarihUzunIso8601,
    required this.ogle,
    required this.yatsi,
  });

  factory PrayerTime.fromJson(Map<String, dynamic> json) => PrayerTime(
        aksam: json["Aksam"],
        ayinSekliUrl: json["AyinSekliURL"],
        greenwichOrtalamaZamani: json["GreenwichOrtalamaZamani"],
        gunes: json["Gunes"],
        gunesBatis: json["GunesBatis"],
        gunesDogus: json["GunesDogus"],
        hicriTarihKisa: json["HicriTarihKisa"],
        hicriTarihKisaIso8601: json["HicriTarihKisaIso8601"],
        hicriTarihUzun: json["HicriTarihUzun"],
        hicriTarihUzunIso8601: json["HicriTarihUzunIso8601"],
        ikindi: json["Ikindi"],
        imsak: json["Imsak"],
        kibleSaati: json["KibleSaati"],
        miladiTarihKisa: json["MiladiTarihKisa"],
        miladiTarihKisaIso8601: json["MiladiTarihKisaIso8601"],
        miladiTarihUzun: json["MiladiTarihUzun"],
        miladiTarihUzunIso8601: DateTime.parse(json["MiladiTarihUzunIso8601"]),
        ogle: json["Ogle"],
        yatsi: json["Yatsi"],
      );

  Map<String, dynamic> toJson() => {
        "Aksam": aksam,
        "AyinSekliURL": ayinSekliUrl,
        "GreenwichOrtalamaZamani": greenwichOrtalamaZamani,
        "Gunes": gunes,
        "GunesBatis": gunesBatis,
        "GunesDogus": gunesDogus,
        "HicriTarihKisa": hicriTarihKisa,
        "HicriTarihKisaIso8601": hicriTarihKisaIso8601,
        "HicriTarihUzun": hicriTarihUzun,
        "HicriTarihUzunIso8601": hicriTarihUzunIso8601,
        "Ikindi": ikindi,
        "Imsak": imsak,
        "KibleSaati": kibleSaati,
        "MiladiTarihKisa": miladiTarihKisa,
        "MiladiTarihKisaIso8601": miladiTarihKisaIso8601,
        "MiladiTarihUzun": miladiTarihUzun,
        "MiladiTarihUzunIso8601": miladiTarihUzunIso8601.toIso8601String(),
        "Ogle": ogle,
        "Yatsi": yatsi,
      };
}
