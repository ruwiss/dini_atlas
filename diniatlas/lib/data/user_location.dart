import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:diniatlas/utils/errors/failure.dart';
import 'package:diniatlas/utils/errors/location_errors.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'models/user_location.dart';

class UserLocation {
  Future<Either<Either<Failure, LocationException>, UserLocationModel>>
      getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Kullanıcı konum hizmeti açık mı
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return const Left(Left(LocationFailure("Konum hizmeti aktif degil")));
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Left(Right(LocationException("Konum iznini reddettiniz")));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return const Left(
          Left(LocationFailure("Konum iznini kalıcı olarak reddettiniz.")));
    }

    // Kullanıcı pozisyonunu koordinat olarak al
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // Koordinatı placemarka dönüştür
    final List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    // Placemark üzerinden konum bilgisini getir
    final Placemark location = placemarks.first;

    return Right(UserLocationModel.fromPlacemark(location));
  }
}
