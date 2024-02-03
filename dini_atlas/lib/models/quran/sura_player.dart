class SuraPlayer {
  final String audio;
  final List<SuraPage> pages;

  SuraPlayer({
    required this.audio,
    required this.pages,
  });

  factory SuraPlayer.fromJson(Map<String, dynamic> json) => SuraPlayer(
        audio: json["audio"],
        pages:
            List<SuraPage>.from(json["pages"].map((x) => SuraPage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "audio": audio,
        "pages": List<dynamic>.from(pages.map((x) => x.toJson())),
      };
}

class SuraPage {
  final int ayah;
  final int endTime;
  final String? page;
  final String? polygon;
  final int startTime;
  final String? x;
  final String? y;

  SuraPage({
    required this.ayah,
    required this.endTime,
    this.page,
    this.polygon,
    required this.startTime,
    this.x,
    this.y,
  });

  factory SuraPage.fromJson(Map<String, dynamic> json) => SuraPage(
        ayah: json["ayah"],
        endTime: json["end_time"],
        page: json["page"],
        polygon: json["polygon"],
        startTime: json["start_time"],
        x: json["x"],
        y: json["y"],
      );

  Map<String, dynamic> toJson() => {
        "ayah": ayah,
        "end_time": endTime,
        "page": page,
        "polygon": polygon,
        "start_time": startTime,
        "x": x,
        "y": y,
      };
}
