import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/models/quran/ayah_list.dart';
import 'package:dini_atlas/models/quran/quran_reciter.dart';
import 'package:dini_atlas/models/quran/sura_audio.dart';
import 'package:dini_atlas/models/quran/sura_info.dart';
import 'package:dini_atlas/models/quran/sura_player.dart';
import 'package:fpdart/fpdart.dart';
import 'dio_service.dart';

class QuranException implements Exception {
  final String message;
  QuranException(this.message);
}

class QuranService {
  final _dio = locator<DioService>();
  List<QuranReciter>? _quranReciters;

  QuranReciter? _currentAudioReciter;
  SuraAudio? _suraAudio;

  final String _sura = "/kuran";
  final String _suras = "/kuran/sureler";
  final String _reciters = "/kuran/okuyucular";

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

  Future<Either<List<QuranReciter>, QuranException>> getQuranReciters() async {
    if (_quranReciters != null) return Left(_quranReciters!);
    try {
      final response = await _dio.request(_reciters);

      // Cevap yoksa veya sunucu hata gönderdiyse
      if (response == null || response.statusCode != 200) {
        return Right(QuranException(response?.statusMessage ?? "Hata"));
      }

      // Gelen veri
      final data = response.data as List;

      // Nesne oluştur
      final quranReciters = data.map((e) => QuranReciter.fromJson(e)).toList();
      _quranReciters = quranReciters;
      return Left(quranReciters);
    } catch (e) {
      return Right(QuranException("Okuyucu listesi alınırken sorun oluştu $e"));
    }
  }

  Future<Either<SuraAudio, QuranException>> getSuraAudio(
      QuranReciter reciter) async {
    if (reciter == _currentAudioReciter) return Left(_suraAudio!);
    try {
      final response = await _dio.request(reciter.reciterUrl);
      // Cevap yoksa veya sunucu hata gönderdiyse
      if (response == null || response.statusCode != 200) {
        return Right(QuranException(response?.statusMessage ?? "Hata"));
      }

      final data = response.data as Map<String, dynamic>;

      // Nesne oluştur
      _suraAudio = SuraAudio.fromJson(data);
      _currentAudioReciter = reciter;

      return Left(_suraAudio!);
    } catch (e) {
      return Right(
          QuranException("Sure audio listesi alınırken sorun oluştu $e"));
    }
  }

  SuraPlayer? _currentSuraPlayerModel;
  String? _currentPlayerUrl;

  Future<Either<SuraPlayer, QuranException>> getSuraPlayer(String url) async {
    if (_currentSuraPlayerModel != null && _currentPlayerUrl == url) {
      return Left(_currentSuraPlayerModel!);
    }

    try {
      final response = await _dio.request(url);

      // Cevap yoksa veya sunucu hata gönderdiyse
      if (response == null || response.statusCode != 200) {
        return Right(QuranException(response?.statusMessage ?? "Hata"));
      }

      final data = response.data as Map<String, dynamic>;

      // Nesne oluştur
      _currentSuraPlayerModel = SuraPlayer.fromJson(data);
      _currentPlayerUrl = url;

      return Left(_currentSuraPlayerModel!);
    } catch (e) {
      return Right(
          QuranException("Sûre audio listesi alınırken sorun oluştu $e"));
    }
  }
}
