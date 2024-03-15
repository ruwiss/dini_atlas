import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  /// Verilen tarihi [13 Şubat Salı, 14:52] formatına döndürür
  String formatDateTimeAsString() {
    final formatter = DateFormat('dd MMMM EEEE HH:mm', 'tr');
    String formattedDate = formatter.format(this);
    return formattedDate;
  }

  /// Verilen tarihi [16-03-2024] formatına döndürür
  String formatDateTimeString() {
    final formatter = DateFormat('dd-MM-yyyy', 'tr');
    String formattedDate = formatter.format(this);
    return formattedDate;
  }

  // %Y-%m-%d
  String convertYMDtimeString() => DateFormat('yyyy-MM-dd').format(this);
}
