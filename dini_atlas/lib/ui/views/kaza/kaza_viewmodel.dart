import 'package:dini_atlas/extensions/string_extensions.dart';
import 'package:dini_atlas/ui/views/kaza/kaza_view.form.dart';
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
  AuthType _authType = AuthType.login;
  AuthType get authType => _authType;

  void onAuthTypeChange() {
    _authType = switch (_authType) {
      AuthType.login => AuthType.register,
      AuthType.register => AuthType.login,
    };
    clearForm();
    clearErrors();
    notifyListeners();
  }

  void onAuthButtonTap() {
    if (_authType == AuthType.login) {
      if (hasKazaAuthMail &&
          hasKazaAuthPass1 &&
          kazaAuthMailValue!.isValidEmail()) {
        // Login
      }
    } else {
      if (hasKazaAuthMail &&
          hasKazaAuthPass1 &&
          hasKazaAuthPass2 &&
          kazaAuthPass1Value == kazaAuthPass2Value &&
          kazaAuthMailValue!.isValidEmail()) {
        // Register
      }
    }
  }
}
