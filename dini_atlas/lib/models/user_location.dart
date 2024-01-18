import 'package:geocoding/geocoding.dart';

class UserLocation {
  String country;
  String city;
  UserLocation({required this.country, required this.city});

  UserLocation.fromPlacemark(Placemark placemark)
      : country = placemark.country!.trim(),
        city = placemark.administrativeArea!.trim();

  UserLocation.fromJson(Map<String, dynamic> json)
      : country = json['country'],
        city = json['city'];

  Map<String, dynamic> toJson() => {'country': country, 'city': city};
}
