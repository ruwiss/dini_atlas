part of 'location_cubit.dart';

sealed class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

final class LocationInit extends LocationState {}

final class LocationLoading extends LocationState {}

final class LocationError extends LocationState {
  final String message;
  const LocationError(this.message);

  @override
  List<Object> get props => [message];
}

final class LocationApproved extends LocationState {
  final UserLocationModel userLocation;
  const LocationApproved(this.userLocation);

  @override
  List<Object> get props => [userLocation];
}
