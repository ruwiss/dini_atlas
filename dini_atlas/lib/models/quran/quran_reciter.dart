class QuranReciter {
  final int id;
  final String name;
  final String reciterUrl;

  QuranReciter(this.id, this.name, this.reciterUrl);

  QuranReciter.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        reciterUrl = json['reciter_url'];
}
