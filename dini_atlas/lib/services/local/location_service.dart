import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import '../../models/user_location.dart';

class LocationException implements Exception {
  final String message;
  LocationException(this.message);
}

class LocationService {
  Future<Either<UserLocation, LocationException>> getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Kullanıcı konum hizmeti açık mı
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Right(LocationException("Konum hizmeti aktif degil"));
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Right(LocationException("Konum iznini reddettiniz"));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Right(
          LocationException("Konum iznini kalıcı olarak reddettiniz."));
    }

    // Kullanıcı pozisyonunu koordinat olarak al
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // Koordinatı placemarka dönüştür
    final List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    // Placemark üzerinden konum bilgisini getir
    final Placemark location = placemarks.first;

    // Nesne oluştur
    final UserLocation userLocation = UserLocation.fromJson(location.toJson());

    if (kDebugMode) {
      print(
          "Kullanıcı konumu alındı: ${userLocation.country}: ${userLocation.city}");
    }

    return Left(userLocation);
  }
}
