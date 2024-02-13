import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/extensions/string_extensions.dart';
import 'package:dini_atlas/models/kaza/kaza.dart';
import 'package:dini_atlas/models/user_setting.dart';
import 'package:dini_atlas/services/local/network_checker.dart';
import 'package:dini_atlas/services/local/user_settings_service.dart';
import 'package:dini_atlas/services/remote/auth_service.dart';
import 'package:dini_atlas/services/remote/kaza_service.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/views/kaza/widgets/auth_widget.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

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
  final networkChecker = locator<NetworkChecker>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _authService = locator<AuthService>();
  final _userSettingsService = locator<UserSettingsService>();
  final _kazaService = locator<KazaService>();

  late UserSettings _userSettings;
  bool get isUserLoggedIn => _userSettings.userAuth != null;

  AuthType _authType = AuthType.login;
  AuthType get authType => _authType;

  UserAuth? _userAuthInformation;

  Kaza? _kaza;
  Kaza? get kaza => _kaza;

  void init() async {
    runBusyFuture(_getUserSettings());
  }

  Future<void> _getUserSettings() async {
    _userSettings = (await _userSettingsService.getUserSettings())!;
    if (isUserLoggedIn) {
      _userAuthInformation = _userSettings.userAuth!;
      await _getUserKaza();
    }
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
    _userAuthInformation = UserAuth()
      ..email = kazaAuthMailValue!
      ..password = kazaAuthPass1Value!;

    final result = await _authService.auth(
        userAuth: _userAuthInformation!, isLogin: _authType == AuthType.login);

    result.fold(
      (userSettings) {
        _userSettings = userSettings;
        notifyListeners();

        // kullanıcı kaza bilgilerini getir
        runBusyFuture(_getUserKaza());
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

  Future<void> _getUserKaza() async {
    final result = await _kazaService.getUserKaza(_userAuthInformation!);
    _kaza = result ?? Kaza.createEmpty();
    notifyListeners();
  }

  void updateKaza(Kaza kaza) {
    _kaza = kaza;
    notifyListeners();
  }

  void saveKazaData() async {
    kaza!.lastUpdated = DateTime.now();
    setBusy(true);
    final result = await _kazaService.setUserKaza(
        userAuth: _userAuthInformation!, kaza: kaza!);
    setBusy(false);
    notifyListeners();
    if (result) {
      _bottomSheetService.showBottomSheet(
        title: "Başarılı",
        description: "Kaza bilgileri kaydedildi",
        confirmButtonTitle: "Kapat",
      );
    } else {
      _bottomSheetService.showBottomSheet(
        title: "Bir sorun oluştu",
        description:
            "Sanırım sunucuyla ilgili bir problem var. Bilgilerinizi birazdan tekrar kaydetmeyi deneyin. İletişim: $ksMail",
        confirmButtonTitle: "Anladım",
      );
    }
  }

  @override
  void dispose() {
    networkChecker.dispose();
    super.dispose();
  }
}
