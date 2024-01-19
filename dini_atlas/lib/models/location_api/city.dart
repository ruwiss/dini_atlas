class City {
    final String sehirAdi;
    final String sehirAdiEn;
    final String sehirId;

    City({
        required this.sehirAdi,
        required this.sehirAdiEn,
        required this.sehirId,
    });

    factory City.fromJson(Map<String, dynamic> json) => City(
        sehirAdi: json["SehirAdi"],
        sehirAdiEn: json["SehirAdiEn"],
        sehirId: json["SehirID"],
    );

    Map<String, dynamic> toJson() => {
        "SehirAdi": sehirAdi,
        "SehirAdiEn": sehirAdiEn,
        "SehirID": sehirId,
    };
}
