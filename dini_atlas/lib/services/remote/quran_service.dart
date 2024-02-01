import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/models/quran/sura_model.dart';
import 'package:fpdart/fpdart.dart';
import 'dio_service.dart';

class QuranException implements Exception {
  final String message;
  QuranException(this.message);
}

class QuranService {
  final _dio = locator<DioService>();
  final String _sureler = "/kuran/sureler";

  Future<Either<List<SuraModel>, QuranException>> getSuraList() async {
    try {
      final response = await _dio.request(_sureler);

      // Cevap yoksa veya sunucu hata gönderdiyse
      if (response == null || response.statusCode != 200) {
        return Right(QuranException(response?.statusMessage ?? "Hata"));
      }

      // Gelen veri
      final data = response.data as List;

      // Nesne oluştur
      final List<SuraModel> suraList =
          data.map((e) => SuraModel.fromJson(e)).toList();

      return Left(suraList);
    } catch (e) {
      return Right(QuranException(e.toString()));
    }
  }
}
