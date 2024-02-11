import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/models/user_setting.dart';
import 'package:dini_atlas/services/local/user_settings_service.dart';
import 'package:dini_atlas/services/remote/dio_service.dart';
import 'package:fpdart/fpdart.dart';

class AuthException implements Exception {
  final String message;
  AuthException(this.message);
}

class AuthService {
  final _dio = locator<DioService>();
  final _userSettingsService = locator<UserSettingsService>();

  final String _authUrl = "/kullanici/auth";

  Future<Either<UserSettings, AuthException>> auth(
      {required UserAuth userAuth, required bool isLogin}) async {
    final response = await _dio.request(
      _authUrl,
      method: isLogin ? DioMethod.get : DioMethod.post,
      data: userAuth.toJson(),
    );
    if (response == null || response.statusCode != 200) {
      return Right(AuthException("Bir sorun oluştu"));
    }

    final data = response.data as Map<String, dynamic>;
    if (data['success'] == 0) return Right(AuthException(data['message']));

    final result = await _userSettingsService.setUserAuthInformation(userAuth);
    return Left(result);
  }
}
