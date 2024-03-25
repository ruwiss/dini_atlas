import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/models/kaza/kaza.dart';

import 'dio_service.dart';

class KazaService {
  final _dio = locator<DioService>();

  final String _kazaUrl = "/kullanici/kaza";

  Future<Kaza?> getUserKaza(String mail) async {
    final response = await _dio.request(_kazaUrl, data: {"mail": mail});
    if (response == null || response.statusCode != 200) return null;
    final data = response.data['data'] as Map<String, dynamic>;
    if (data.isEmpty) return null;

    return Kaza.fromJson(data);
  }

  Future<bool> setUserKaza({
    required String mail,
    required Kaza kaza,
  }) async {
    final data = {
      "mail": mail,
      "data": kaza.toJson(),
    };

    final response =
        await _dio.request(_kazaUrl, method: DioMethod.post, data: data);

    if (response == null || response.statusCode != 200) return false;

    return response.data['success'] == 1;
  }
}
