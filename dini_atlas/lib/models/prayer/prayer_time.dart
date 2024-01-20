import 'package:isar/isar.dart';

part 'prayer_time.g.dart';

@embedded
class PrayerTime {
  late String imsak;
  late String gunes;
  late String ogle;
  late String ikindi;
  late String aksam;
  late String yatsi;
  late String ayinSekliUrl;
  late String kibleSaati;
  late double greenwichOrtalamaZamani;
  late String gunesBatis;
  late String gunesDogus;
  late String hicriTarihKisa;
  String? hicriTarihKisaIso8601;
  late String hicriTarihUzun;
  String? hicriTarihUzunIso8601;
  late String miladiTarihKisa;
  late String miladiTarihKisaIso8601;
  late String miladiTarihUzun;
  late DateTime miladiTarihUzunIso8601;

  PrayerTime();

  PrayerTime.fromJson(Map<String, dynamic> json)
      : aksam = json["Aksam"],
        ayinSekliUrl = json["AyinSekliURL"],
        greenwichOrtalamaZamani = json["GreenwichOrtalamaZamani"],
        gunes = json["Gunes"],
        gunesBatis = json["GunesBatis"],
        gunesDogus = json["GunesDogus"],
        hicriTarihKisa = json["HicriTarihKisa"],
        hicriTarihKisaIso8601 = json["HicriTarihKisaIso8601"],
        hicriTarihUzun = json["HicriTarihUzun"],
        hicriTarihUzunIso8601 = json["HicriTarihUzunIso8601"],
        ikindi = json["Ikindi"],
        imsak = json["Imsak"],
        kibleSaati = json["KibleSaati"],
        miladiTarihKisa = json["MiladiTarihKisa"],
        miladiTarihKisaIso8601 = json["MiladiTarihKisaIso8601"],
        miladiTarihUzun = json["MiladiTarihUzun"],
        miladiTarihUzunIso8601 = DateTime.parse(json["MiladiTarihUzunIso8601"]),
        ogle = json["Ogle"],
        yatsi = json["Yatsi"];

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
