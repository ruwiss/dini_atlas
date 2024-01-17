import 'package:diniatlas/utils/errors/failure.dart';

class LocationFailure extends Failure {
  const LocationFailure(super.message);

  @override
  List<Object?> get props => [message];
}


class LocationException implements Exception {
  final String message;
  LocationException(this.message);
}
