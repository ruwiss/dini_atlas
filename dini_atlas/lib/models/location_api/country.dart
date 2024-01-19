class Country {
    final String ulkeAdi;
    final String ulkeAdiEn;
    final String ulkeId;

    Country({
        required this.ulkeAdi,
        required this.ulkeAdiEn,
        required this.ulkeId,
    });

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        ulkeAdi: json["UlkeAdi"],
        ulkeAdiEn: json["UlkeAdiEn"],
        ulkeId: json["UlkeID"],
    );

    Map<String, dynamic> toJson() => {
        "UlkeAdi": ulkeAdi,
        "UlkeAdiEn": ulkeAdiEn,
        "UlkeID": ulkeId,
    };
}
