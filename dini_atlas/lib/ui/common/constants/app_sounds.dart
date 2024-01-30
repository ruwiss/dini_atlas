import 'package:dini_atlas/models/noti_sound.dart';

const String kaNoti = "sounds/bildirim.mp3";
const String kaEzan1 = "sounds/ezan1.mp3";
const String kaEzan2 = "sounds/ezan2.mp3";
const String kaEzan3 = "sounds/ezan3.mp3";

final List<NotiSound> kaNotiSounds = [
  NotiSound(id: 0, name: "Bildirim", path: kaNoti),
  NotiSound(id: 1, name: "Ezan 1", path: kaEzan1),
  NotiSound(id: 2, name: "Ezan 2", path: kaEzan2),
  NotiSound(id: 3, name: "Ezan 3", path: kaEzan3),
];
