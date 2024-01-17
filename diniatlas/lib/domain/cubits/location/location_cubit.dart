import 'package:diniatlas/data/models/user_location.dart';
import 'package:diniatlas/data/user_location.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'location_state.dart';

class LocationCubit extends HydratedCubit<LocationState> {
  final UserLocation userLocation;
  LocationCubit(this.userLocation) : super(LocationInit());

  void refresh() async {
    emit(LocationInit());
    await Future.delayed(const Duration(milliseconds: 500));
    getLocation();
  }

  void getLocation() async {
    emit(LocationLoading());
    final result = await userLocation.getUserLocation();

    result.fold(
      (error) {
        error.fold((failure) {
          emit(LocationError(failure.message));
        }, (exception) {
          emit(LocationError(exception.message));
        });
      },
      (value) => emit(LocationApproved(value)),
    );
  }

  @override
  LocationState? fromJson(Map<String, dynamic> json) {
    try {
      return LocationApproved(UserLocationModel.fromJson(json));
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(LocationState state) {
    if (state is LocationApproved) {
      return state.userLocation.toMap();
    }
    return null;
  }
}
