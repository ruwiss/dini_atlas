class SuraInfo {
  final int suraId;
  final int juz;
  final int page;
  final int ayahCount;
  final String name;
  final String nameArabic;
  final String location;

  SuraInfo(this.suraId, this.juz, this.page, this.ayahCount, this.name,
      this.nameArabic, this.location);

  SuraInfo.fromJson(Map<String, dynamic> json)
      : suraId = json['sure'],
        juz = json['cuz'],
        page = json['sayfa'],
        ayahCount = json['ayet_sayisi'],
        name = json['isim'],
        nameArabic = json['isim_ar'],
        location = json['yer'];
}
