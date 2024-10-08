import 'dart:convert';

import 'package:dini_atlas/extensions/string_extensions.dart';

class UserLocation {
  String country;
  String city;
  String state;
  double latitude;
  double longtitude;
  UserLocation({
    required this.country,
    required this.city,
    required this.state,
    required this.latitude,
    required this.longtitude,
  });

  UserLocation.fromJson(Map<String, dynamic> json)
      : country = (json['country'].trim() as String).toLowerCaseTurkish(),
        city =
            (json['administrativeArea'].trim() as String).toLowerCaseTurkish(),
        state = (json['subAdministrativeArea'].trim() as String)
            .toLowerCaseTurkish(),
        latitude = json['latitude'],
        longtitude = json['longitude'];

  factory UserLocation.fromIsarJson(String json) {
    final jsonMap = jsonDecode(json);
    return UserLocation(
      country: jsonMap['country'],
      city: jsonMap['city'],
      state: jsonMap['state'],
      latitude: jsonMap['latitude'],
      longtitude: jsonMap['longtitude'],
    );
  }

  Map<String, dynamic> toJson() => {
        'country': country,
        'city': city,
        'state': state,
        'latitude': latitude,
        'longtitude': longtitude
      };
}
