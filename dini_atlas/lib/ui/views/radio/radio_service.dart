import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/services/remote/dio_service.dart';
import 'package:dini_atlas/ui/common/constants/app_strings.dart';
import 'package:fpdart/fpdart.dart';

class RadioModel {
  final String name;
  final String url;
  RadioModel(this.name, this.url);

  RadioModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        url = json['url'];
}

class RadioException implements Exception {
  final String message;
  RadioException(this.message);
}

class RadioService {
  RadioService._singleton();
  static final RadioService _instance = RadioService._singleton();
  static RadioService get instance => _instance;

  final _dio = locator<DioService>();
  final String _radioUrl = "/radyolar";

  List<RadioModel>? _radioList;

  // Radyo yayınlarını getir
  Future<Either<List<RadioModel>, RadioException>> getRadios() async {
    if (_radioList != null) return Left(_radioList!);

    final response = await _dio.request("$ksBaseUrl$_radioUrl");
    if (response == null || response.statusCode != 200) {
      return Right(
          RadioException("Radyo yayınları getirilirken bir sorun oluştu"));
    }
    final List radios = response.data;
    _radioList = radios.map((e) => RadioModel.fromJson(e)).toList();
    return Left(_radioList!);
  }
}
