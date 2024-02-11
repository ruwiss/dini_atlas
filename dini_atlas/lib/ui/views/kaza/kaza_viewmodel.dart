import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/extensions/string_extensions.dart';
import 'package:dini_atlas/models/user_setting.dart';
import 'package:dini_atlas/services/local/user_settings_service.dart';
import 'package:dini_atlas/services/remote/auth_service.dart';
import 'package:dini_atlas/ui/views/kaza/widgets/auth_widget.form.dart';
import 'package:stacked/stacked.dart';

enum AuthType { login, register }

class KazaAuthFormValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return null;
    if (!value.isValidEmail()) return "Geçerli e-posta adresi giriniz.";
    return null;
  }

  static String? validatePasswords(String? value) {
    if (value == null || value.isEmpty) return null;
    if (value.length < 6) return "Şifreniz en az 6 karakter olmalıdır.";
    return null;
  }
}

class KazaViewModel extends FormViewModel {
  final _authService = locator<AuthService>();
  final _userSettingsService = locator<UserSettingsService>();

  late UserSettings _userSettings;
  bool get isUserLoggedIn => _userSettings.userAuth != null;

  AuthType _authType = AuthType.login;
  AuthType get authType => _authType;

  void init() async {
    runBusyFuture(_userUserSettings());
  }

  Future<void> _userUserSettings() async {
    _userSettings = (await _userSettingsService.getUserSettings())!;
  }

  void onAuthTypeChange() {
    _authType = switch (_authType) {
      AuthType.login => AuthType.register,
      AuthType.register => AuthType.login,
    };
    clearForm();
    clearErrors();
    notifyListeners();
  }

  Future<void> _authUser() async {
    final userAuth = UserAuth()
      ..email = kazaAuthMailValue!
      ..password = kazaAuthPass1Value!;

    final result = await _authService.auth(
        userAuth: userAuth, isLogin: _authType == AuthType.login);

    result.fold(
      (userSettings) {
        _userSettings = userSettings;
        notifyListeners();
      },
      (error) => setError(error.message),
    );
  }

  void onAuthButtonTap() {
    if (_authType == AuthType.login) {
      if (hasKazaAuthMail &&
          hasKazaAuthPass1 &&
          kazaAuthMailValue!.isValidEmail()) {
        // Login
        runBusyFuture(_authUser());
      }
    } else {
      if (hasKazaAuthMail &&
          hasKazaAuthPass1 &&
          hasKazaAuthPass2 &&
          kazaAuthMailValue!.isValidEmail()) {
        if (kazaAuthPass1Value != kazaAuthPass2Value) {
          return setError("Şifreler eşleşmiyor");
        }
        // Register
        runBusyFuture(_authUser());
      }
    }
  }
}