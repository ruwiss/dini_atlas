import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/kaza/kaza_viewmodel.dart';
import 'package:dini_atlas/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked_annotations.dart';

import 'auth_widget.form.dart';

@FormView(fields: [
  FormTextField(
      name: "KazaAuthMail", validator: KazaAuthFormValidator.validateEmail),
  FormTextField(
      name: "KazaAuthPass1",
      validator: KazaAuthFormValidator.validatePasswords),
  FormTextField(
      name: "KazaAuthPass2",
      validator: KazaAuthFormValidator.validatePasswords),
])
class KazaAuthWidget extends StatefulWidget {
  const KazaAuthWidget({super.key, required this.viewModel});
  final KazaViewModel viewModel;

  @override
  State<KazaAuthWidget> createState() => _KazaAuthWidgetState();
}

class _KazaAuthWidgetState extends State<KazaAuthWidget> with $KazaAuthWidget {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => syncFormWithViewModel(widget.viewModel));
  }

  @override
  void dispose() {
    super.dispose();
    disposeForm();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 60),
      children: [
        SvgPicture.asset(kiAuthEmoji),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 46),
          child: Text(
            "Verilerin kayıt edilebilmesi için giriş yapmanız gereklidir.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
        widget.viewModel.authType == AuthType.login
            ? _loginWidget(widget.viewModel)
            : _registerWidget(widget.viewModel),
        if (widget.viewModel.hasError)
          _errorWidget(widget.viewModel.modelError),
        verticalSpace(60),
        _changeActionTypeWidget(
          viewModel: widget.viewModel,
          type: widget.viewModel.authType,
        )
      ],
    );
  }

  Widget _errorWidget(String error) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Text(
        error,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.redAccent,
        ),
      ),
    );
  }

  Widget _loginWidget(KazaViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InputField(
          controller: kazaAuthMailController,
          hintText: "E-Posta adresiniz",
          keyboardType: TextInputType.emailAddress,
        ),
        verticalSpace(20),
        InputField(
          controller: kazaAuthPass1Controller,
          hintText: "Şifreniz",
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
        ),
        verticalSpace(40),
        _actionButton(text: "Giriş Yap", onPressed: viewModel.onAuthButtonTap),
      ],
    );
  }

  Widget _registerWidget(KazaViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InputField(
          controller: kazaAuthMailController,
          hintText: "E-Posta adresiniz",
          keyboardType: TextInputType.emailAddress,
          errorText: viewModel.hasKazaAuthMailValidationMessage
              ? viewModel.kazaAuthMailValidationMessage
              : null,
        ),
        verticalSpace(20),
        InputField(
          controller: kazaAuthPass1Controller,
          hintText: "Şifreniz",
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          errorText: viewModel.hasKazaAuthPass1ValidationMessage
              ? viewModel.kazaAuthPass1ValidationMessage
              : null,
        ),
        verticalSpace(20),
        InputField(
          controller: kazaAuthPass2Controller,
          hintText: "Tekrar şifreniz",
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          errorText: viewModel.hasKazaAuthPass2ValidationMessage
              ? viewModel.kazaAuthPass2ValidationMessage
              : null,
        ),
        verticalSpace(40),
        _actionButton(text: "Kayıt Ol", onPressed: viewModel.onAuthButtonTap),
      ],
    );
  }

  Widget _actionButton({
    required VoidCallback? onPressed,
    required String text,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: kcButtonColor,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: kcGrayColor,
        ),
      ),
    );
  }

  Widget _changeActionTypeWidget(
      {required KazaViewModel viewModel, required AuthType type}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          type == AuthType.login ? "Hesabın yok mu?" : "Bir hesabın mı var?",
          style: const TextStyle(
            fontSize: 15,
            color: kcGrayColor,
          ),
        ),
        horizontalSpaceSmall,
        GestureDetector(
          onTap: () => viewModel.onAuthTypeChange(),
          child: Text(
            type == AuthType.login ? "Kayıt Ol" : "Giriş Yap",
            style: const TextStyle(
              fontSize: 15,
              color: kcPrimaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
