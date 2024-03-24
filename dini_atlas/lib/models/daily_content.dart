class ContentsOfTime {
  final AyetContent ayet;
  final HadisContent hadis;
  final String dua;
  final String erkekIsim;
  final String kizIsim;
  final SoruCevapContent soruCevap;

  ContentsOfTime({
    required this.ayet,
    required this.hadis,
    required this.dua,
    required this.erkekIsim,
    required this.kizIsim,
    required this.soruCevap,
  });
}

class AyetContent {
  final String metin;
  final String kaynak;
  AyetContent(this.metin, this.kaynak);

  AyetContent.fromJson(Map<String, dynamic> json)
      : metin = json['metin'],
        kaynak = json['kaynak'];
}

class HadisContent {
  final String metin;
  final String kaynak;
  HadisContent(this.metin, this.kaynak);

  HadisContent.fromJson(Map<String, dynamic> json)
      : metin = json['turkce'],
        kaynak = "Riyazus Salihin No: ${json['hadis_id']}";
}

class SoruCevapContent {
  final String soru;
  final String cevap;

  SoruCevapContent(this.soru, this.cevap);

  SoruCevapContent.fromJson(Map<String, dynamic> json)
      : soru = json['soru'],
        cevap = json['cevap'];
}
