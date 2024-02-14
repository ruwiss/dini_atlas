import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/services/remote/dio_service.dart';
import 'package:dini_atlas/ui/common/constants/app_strings.dart';
import 'package:fpdart/fpdart.dart';

class RiyazusSalihinException implements Exception {
  final String message;
  RiyazusSalihinException(this.message);
}

class RiyazusSalihinService {
  RiyazusSalihinService._singleton();
  static final RiyazusSalihinService _instance =
      RiyazusSalihinService._singleton();
  static RiyazusSalihinService get instance => _instance;

  final _dio = locator<DioService>();

  List<RiyazusSalihinModel>? _hadisList;

  // Hadisleri getir
  Future<Either<List<RiyazusSalihinModel>, RiyazusSalihinException>>
      getRiyazusSalihin({int offset = 0, int? id, String? filter}) async {
    final bool isFirstContent =
        _hadisList != null && id == null && filter == null && offset == 0;

    if (isFirstContent) Left(_hadisList!);

    String hadisUrl = "/hadis/riyazus_salihin";

    Map<String, dynamic> args = {};
    if (id != null) {
      hadisUrl += "/$id";
    } else if (filter != null) {
      hadisUrl += "/ara";
      args['query'] = filter;
    } else if (offset > 0) {
      args['offset'] = offset;
    }

    final response = await _dio.request("$ksBaseUrl$hadisUrl", data: args);
    if (response == null || response.statusCode != 200) {
      return Right(RiyazusSalihinException(
          "Riyazus Salihin getirilirken sorun oluştu. ${response?.data}"));
    }

    final List dataList = response.data;
    final List<RiyazusSalihinModel> hadisList =
        dataList.map((e) => RiyazusSalihinModel.fromJson(e)).toList();

    // İlk içerikse listeyi doldur
    if (isFirstContent) {
      _hadisList = hadisList;
      // Loadmore ise ekleme yap
    } else if (offset > 0) {
      _hadisList!.addAll(hadisList);
    }

    // Eğer filtre uygulandıysa filtreli içeriği döndür, aksi halde kayıtlı içeriği ver
    return Left(isFirstContent || offset > 0 ? _hadisList! : hadisList);
  }
}

class RiyazusSalihinModel {
  final int id;
  final String arabic;
  final String turkish;
  final String title;

  RiyazusSalihinModel(this.id, this.arabic, this.turkish, this.title);

  RiyazusSalihinModel.fromJson(Map<String, dynamic> json)
      : id = json['hadis_id'],
        arabic = json['arapca'],
        turkish = json['turkce'],
        title = json['baslik'];
}
