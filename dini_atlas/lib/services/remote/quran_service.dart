import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/models/quran/ayah_list.dart';
import 'package:dini_atlas/models/quran/sura_info.dart';
import 'package:fpdart/fpdart.dart';
import 'dio_service.dart';

class QuranException implements Exception {
  final String message;
  QuranException(this.message);
}

class QuranService {
  final _dio = locator<DioService>();
  final String _sura = "/kuran";
  final String _suras = "/kuran/sureler";

  Future<Either<List<SuraInfo>, QuranException>> getSuraList() async {
    try {
      final response = await _dio.request(_suras);

      // Cevap yoksa veya sunucu hata gönderdiyse
      if (response == null || response.statusCode != 200) {
        return Right(QuranException(response?.statusMessage ?? "Hata"));
      }

      // Gelen veri
      final data = response.data as List;

      // Nesne oluştur
      final List<SuraInfo> suraList =
          data.map((e) => SuraInfo.fromJson(e)).toList();

      return Left(suraList);
    } catch (e) {
      return Right(QuranException(e.toString()));
    }
  }

  Future<Either<AyahList, QuranException>> getSuraAyahList({
    required int suraId,
    int? ayah,
    int offset = 0,
  }) async {
    final Map<String, dynamic> args = {};
    args['sure'] = suraId;
    args['offset'] = offset;
    if (ayah != null) args['ayet'] = ayah;

    try {
      final response = await _dio.request(_sura, data: args);

      // Cevap yoksa veya sunucu hata gönderdiyse
      if (response == null || response.statusCode != 200) {
        return Right(QuranException(response?.statusMessage ?? "Hata"));
      }

      // Gelen veri
      final data = response.data as Map<String, dynamic>;

      // Nesne oluştur
      final AyahList ayahList = AyahList.fromJson(data);
      return Left(ayahList);
    } catch (e) {
      return Right(QuranException("Ayet listesi alınırken sorun oluştu: $e"));
    }
  }
}
