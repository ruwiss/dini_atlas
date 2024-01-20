import 'package:isar/isar.dart';

part 'eid_prayer.g.dart';

@embedded
class EidPrayerTime {
  late BayramNamazVakti bayramNamazVakti;
  late IlceBilgisi ilceBilgisi;

  EidPrayerTime();

  EidPrayerTime.fromJson(Map<String, dynamic> json)
      : bayramNamazVakti = BayramNamazVakti.fromJson(json["bayramNamazVakti"]),
        ilceBilgisi = IlceBilgisi.fromJson(json["ilceBilgisi"]);

  Map<String, dynamic> toJson() => {
        "bayramNamazVakti": bayramNamazVakti.toJson(),
        "ilceBilgisi": ilceBilgisi.toJson(),
      };
}

@embedded
class BayramNamazVakti {
  @Name("kurbanNamaziHTarih")
  late String kurbanBayramNamaziHTarihi;
  @Name("kurbanNamaziSaat")
  late String kurbanBayramNamaziSaati;
  @Name("kurbanNamaziTarih")
  late String kurbanBayramNamaziTarihi;
  @Name("ramazanNamaziHTarih")
  late String ramazanBayramNamaziHTarihi;
  @Name("ramazanNamaziSaat")
  late String ramazanBayramNamaziSaati;
  @Name("ramazanNamaziTarih")
  late String ramazanBayramNamaziTarihi;

  BayramNamazVakti();

  BayramNamazVakti.fromJson(Map<String, dynamic> json)
      : kurbanBayramNamaziHTarihi = json["KurbanBayramNamaziHTarihi"],
        kurbanBayramNamaziSaati = json["KurbanBayramNamaziSaati"],
        kurbanBayramNamaziTarihi = json["KurbanBayramNamaziTarihi"],
        ramazanBayramNamaziHTarihi = json["RamazanBayramNamaziHTarihi"],
        ramazanBayramNamaziSaati = json["RamazanBayramNamaziSaati"],
        ramazanBayramNamaziTarihi = json["RamazanBayramNamaziTarihi"];

  Map<String, dynamic> toJson() => {
        "KurbanBayramNamaziHTarihi": kurbanBayramNamaziHTarihi,
        "KurbanBayramNamaziSaati": kurbanBayramNamaziSaati,
        "KurbanBayramNamaziTarihi": kurbanBayramNamaziTarihi,
        "RamazanBayramNamaziHTarihi": ramazanBayramNamaziHTarihi,
        "RamazanBayramNamaziSaati": ramazanBayramNamaziSaati,
        "RamazanBayramNamaziTarihi": ramazanBayramNamaziTarihi,
      };
}

@embedded
class IlceBilgisi {
  late String cografiKibleAcisi;
  late String ilceAdi;
  late String? ilceAdiEn;
  late String ilceId;
  late String kabeyeUzaklik;
  late String kibleAcisi;
  late String sehirAdi;
  late String? sehirAdiEn;
  late String ulkeAdi;
  late String? ulkeAdiEn;

  IlceBilgisi();

  IlceBilgisi.fromJson(Map<String, dynamic> json)
      : cografiKibleAcisi = json["CografiKibleAcisi"],
        ilceAdi = json["IlceAdi"],
        ilceAdiEn = json["IlceAdiEn"],
        ilceId = json["IlceID"],
        kabeyeUzaklik = json["KabeyeUzaklik"],
        kibleAcisi = json["KibleAcisi"],
        sehirAdi = json["SehirAdi"],
        sehirAdiEn = json["SehirAdiEn"],
        ulkeAdi = json["UlkeAdi"],
        ulkeAdiEn = json["UlkeAdiEn"];

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
