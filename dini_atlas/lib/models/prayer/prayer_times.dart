import 'package:dini_atlas/models/prayer/eid_prayer.dart';
import 'package:dini_atlas/models/prayer/prayer_time.dart';
import 'package:isar/isar.dart';

part 'prayer_times.g.dart';

@collection
class PrayerTimes {
  Id id = Isar.autoIncrement;

  late EidPrayerTime eidPrayers;

  late List<PrayerTime> prayerTimes;

  DateTime lastFetch = DateTime.now();
}
