import 'package:dini_atlas/ui/common/constants/app_strings.dart';
import 'package:intl/intl.dart';

class ReligiousDays {
  final String date;
  final DateTime dateTime;
  final String day;
  final String hicriDate;

  ReligiousDays(this.date, this.dateTime, this.day, this.hicriDate);

  factory ReligiousDays.fromJson(Map<String, dynamic> json) {
    final dateFormat = DateFormat('dd MMMM yyyy', ksDefaultLocale);
    final dateString = (json['date'] as String)
        .replaceAll("i̇", "i")
        .replaceAll("Sali", "Salı");
    final dateTime = dateFormat.parse(dateString);
    final day = (json['day'] as String)
        .replaceAll("(", "")
        .replaceAll(")", "")
        .replaceAll(". Gün", "");
    return ReligiousDays(dateString, dateTime, day, json['hicri_date']);
  }
}
