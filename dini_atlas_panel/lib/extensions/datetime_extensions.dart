import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  // Verilen tarihi [13 Şubat Salı, 14:52] formatına döndürür
  String formatDateTimeAsString() {
    final formatter = DateFormat('dd MMMM EEEE HH:mm', 'tr');
    String formattedDate = formatter.format(this);
    return formattedDate;
  }
}
