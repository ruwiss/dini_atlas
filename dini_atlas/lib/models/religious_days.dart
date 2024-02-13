class ReligiousDays {
  final String date;
  final String day;
  final String hicriDate;

  ReligiousDays(this.date, this.day, this.hicriDate);

  ReligiousDays.fromJson(Map<String, dynamic> json)
      : date = json['date'],
        day = json['day'],
        hicriDate = json['hicri_date'];
}
