import 'dart:convert';

class PrayerSharedP {
  final DateTime date;
  final List<PrayerSharedPItem> items;

  PrayerSharedP(this.date, this.items);

  factory PrayerSharedP.fromSharedPrefItem(String item) {
    final Map<String, dynamic> json = jsonDecode(item);
    final DateTime date = DateTime.parse(json.keys.first);
    final times = json.values.first as Map<String, dynamic>;
    final items = times.entries.map((e) => PrayerSharedPItem(e.key, e.value));

    return PrayerSharedP(date, items.toList());
  }
}

class PrayerSharedPItem {
  final String name;
  final String timeValue;

  PrayerSharedPItem(this.name, this.timeValue);
}
