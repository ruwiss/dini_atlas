import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/models/kaza/kaza.dart';
import 'package:dini_atlas/models/user_setting.dart';

import 'dio_service.dart';

class KazaService {
  final _dio = locator<DioService>();

  final String _kazaUrl = "/kullanici/kaza";

  Future<Kaza?> getUserKaza(UserAuth userAuth) async {
    final response = await _dio.request(_kazaUrl, data: userAuth.toJson());

    if (response == null || response.statusCode != 200) return null;

    final data = response.data as Map<String, dynamic>;
    if (data.isEmpty) return null;
    
    return Kaza.fromJson(data);
  }

  Future<bool> setUserKaza({
    required UserAuth userAuth,
    required Kaza kaza,
  }) async {
    final data = userAuth.toJson();
    data['data'] = kaza.toJson();

    final response =
        await _dio.request(_kazaUrl, method: DioMethod.post, data: data);

    if (response == null || response.statusCode != 200) return false;

    return response.data['success'] == 1;
  }
}
