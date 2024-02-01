class SuraModel {
  final int suraId;
  final int page;
  final int ayahCount;
  final String name;
  final String nameArabic;
  final String location;

  SuraModel(this.suraId, this.page, this.ayahCount, this.name, this.nameArabic,
      this.location);

  SuraModel.fromJson(Map<String, dynamic> json)
      : suraId = json['sure'],
        page = json['sayfa'],
        ayahCount = json['ayet_sayisi'],
        name = json['isim'],
        nameArabic = json['isim_ar'],
        location = json['yer'];
}
