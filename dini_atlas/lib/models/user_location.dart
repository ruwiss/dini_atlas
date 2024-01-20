import 'dart:convert';

class UserLocation {
  String country;
  String city;
  String state;
  UserLocation(
      {required this.country, required this.city, required this.state});

  UserLocation.fromJson(Map<String, dynamic> json)
      : country = json['country'].trim(),
        city = json['administrativeArea'].trim(),
        state = json['subAdministrativeArea'].trim();

  factory UserLocation.fromIsarJson(String json) {
    final jsonMap = jsonDecode(json);
    return UserLocation(
      country: jsonMap['country'],
      city: jsonMap['city'],
      state: jsonMap['state'],
    );
  }

  Map<String, dynamic> toJson() =>
      {'country': country, 'city': city, 'state': state};
}
