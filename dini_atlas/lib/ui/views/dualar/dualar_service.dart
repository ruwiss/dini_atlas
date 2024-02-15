import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/services/remote/dio_service.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:fpdart/fpdart.dart';

class GunlukDualarException implements Exception {
  final String message;
  GunlukDualarException(this.message);
}

class DualarService {
  DualarService._singleton();

  static final DualarService _instance = DualarService._singleton();
  static DualarService get instance => _instance;

  final _dio = locator<DioService>();
  final String _dualarUrl = "/dualar";

  List? _dailyPrayersList;

  Future<Either<List, GunlukDualarException>>
      fetchDailyPrayers() async {
    if (_dailyPrayersList != null) return Left(_dailyPrayersList!);
    final response = await _dio.request("$ksBaseUrl$_dualarUrl");
    if (response == null || response.statusCode != 200) {
      return Right(
          GunlukDualarException("Günlük dualar getirilirken bir sorun oluştu"));
    }

    final data = response.data! as List;
    _dailyPrayersList = data;
    return Left(data);
  }
}
