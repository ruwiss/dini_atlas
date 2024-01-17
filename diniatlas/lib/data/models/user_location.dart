// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:geocoding/geocoding.dart';

class UserLocationModel {
  String country;
  String city;
  UserLocationModel({required this.country, required this.city});

  UserLocationModel.fromPlacemark(Placemark placemark)
      : country = placemark.country!.trim(),
        city = placemark.administrativeArea!.trim();


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'country': country,
      'city': city,
    };
  }

  factory UserLocationModel.fromJson(Map<String, dynamic> map) {
    return UserLocationModel(
      country: map['country'] as String,
      city: map['city'] as String,
    );
  }

  String toJson() => json.encode(toMap());

}
