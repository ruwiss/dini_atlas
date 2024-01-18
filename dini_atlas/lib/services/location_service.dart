import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import '../models/user_location.dart';

class LocationException implements Exception {
  final String message;
  LocationException(this.message);
}

class LocationFailure {
  final String message;
  const LocationFailure(this.message);
}

class LocationService {
  Future<UserLocation?> getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Kullanıcı konum hizmeti açık mı
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw const LocationFailure("Konum hizmeti aktif degil");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw LocationException("Konum iznini reddettiniz");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw const LocationFailure("Konum iznini kalıcı olarak reddettiniz.");
    }

    // Kullanıcı pozisyonunu koordinat olarak al
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // Koordinatı placemarka dönüştür
    final List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    // Placemark üzerinden konum bilgisini getir
    final Placemark location = placemarks.first;

    return UserLocation.fromPlacemark(location);
  }
}
