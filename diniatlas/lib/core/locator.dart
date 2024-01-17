import 'package:diniatlas/data/user_location.dart';
import 'package:diniatlas/domain/cubits/location/location_cubit.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

void di() {
  injector
    ..registerSingleton<UserLocation>(UserLocation())
    ..registerSingleton<LocationCubit>(LocationCubit(injector<UserLocation>()));
}
