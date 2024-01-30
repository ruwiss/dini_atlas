class NotiSound {
  final int id;
  final String name;
  final String path;

  NotiSound({required this.id, required this.name, required this.path});

  String get rawPath => path.replaceAll("sounds/", "").replaceAll(".mp3", "");
}
