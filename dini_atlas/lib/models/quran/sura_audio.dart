class SuraAudio {
  final int reciterId;
  final List<SuraAudioItem> items;

  SuraAudio(this.reciterId, this.items);

  SuraAudio.fromJson(Map<String, dynamic> json)
      : reciterId = json['okuyucuId'],
        items = List<SuraAudioItem>.from(
            json['liste'].map((x) => SuraAudioItem.fromJson(x)));
}

class SuraAudioItem {
  final int suraId;
  final String url;

  SuraAudioItem(this.suraId, this.url);

  SuraAudioItem.fromJson(Map<String, dynamic> json)
      : suraId = json['id'],
        url = json['url'];
}
