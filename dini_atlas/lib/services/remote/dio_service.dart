import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dio/dio.dart';

enum DioMethod { get, post, patch, delete }

class DioService {
  final Dio _dio = Dio()
    ..options = BaseOptions(
      baseUrl: ksBaseUrl,
      responseType: ResponseType.json,
      contentType: Headers.jsonContentType,
      validateStatus: (status) => true,
    );

  Future<Response?> request(
    url, {
    DioMethod method = DioMethod.get,
    Object? data,
  }) async {
    final req = switch (method) {
      DioMethod.get => _dio.get,
      DioMethod.post => _dio.post,
      DioMethod.patch => _dio.patch,
      DioMethod.delete => _dio.delete
    };

    final bool withArgs = method == DioMethod.get;
    final Object? postData = !withArgs ? data : null;
    final Map<String, dynamic>? queryData =
        withArgs ? (data as Map<String, dynamic>?) : null;

    try {
      return await req(
        url,
        data: postData,
        queryParameters: queryData,
        options: Options(
          headers: {"token": ksToken},
        ),
      );
    } on DioException catch (e) {
      throw "${e.message} : ${e.error}";
    }
  }
}
