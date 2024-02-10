// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:dini_atlas/ui/views/kaza/kaza_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String KazaAuthMailValueKey = 'KazaAuthMail';
const String KazaAuthPass1ValueKey = 'KazaAuthPass1';
const String KazaAuthPass2ValueKey = 'KazaAuthPass2';

final Map<String, TextEditingController> _KazaViewTextEditingControllers = {};

final Map<String, FocusNode> _KazaViewFocusNodes = {};

final Map<String, String? Function(String?)?> _KazaViewTextValidations = {
  KazaAuthMailValueKey: KazaAuthFormValidator.validateEmail,
  KazaAuthPass1ValueKey: KazaAuthFormValidator.validatePasswords,
  KazaAuthPass2ValueKey: KazaAuthFormValidator.validatePasswords,
};

mixin $KazaView {
  TextEditingController get kazaAuthMailController =>
      _getFormTextEditingController(KazaAuthMailValueKey);
  TextEditingController get kazaAuthPass1Controller =>
      _getFormTextEditingController(KazaAuthPass1ValueKey);
  TextEditingController get kazaAuthPass2Controller =>
      _getFormTextEditingController(KazaAuthPass2ValueKey);

  FocusNode get kazaAuthMailFocusNode =>
      _getFormFocusNode(KazaAuthMailValueKey);
  FocusNode get kazaAuthPass1FocusNode =>
      _getFormFocusNode(KazaAuthPass1ValueKey);
  FocusNode get kazaAuthPass2FocusNode =>
      _getFormFocusNode(KazaAuthPass2ValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_KazaViewTextEditingControllers.containsKey(key)) {
      return _KazaViewTextEditingControllers[key]!;
    }

    _KazaViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _KazaViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_KazaViewFocusNodes.containsKey(key)) {
      return _KazaViewFocusNodes[key]!;
    }
    _KazaViewFocusNodes[key] = FocusNode();
    return _KazaViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    kazaAuthMailController.addListener(() => _updateFormData(model));
    kazaAuthPass1Controller.addListener(() => _updateFormData(model));
    kazaAuthPass2Controller.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    kazaAuthMailController.addListener(() => _updateFormData(model));
    kazaAuthPass1Controller.addListener(() => _updateFormData(model));
    kazaAuthPass2Controller.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          KazaAuthMailValueKey: kazaAuthMailController.text,
          KazaAuthPass1ValueKey: kazaAuthPass1Controller.text,
          KazaAuthPass2ValueKey: kazaAuthPass2Controller.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _KazaViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _KazaViewFocusNodes.values) {
      focusNode.dispose();
    }

    _KazaViewTextEditingControllers.clear();
    _KazaViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get kazaAuthMailValue =>
      this.formValueMap[KazaAuthMailValueKey] as String?;
  String? get kazaAuthPass1Value =>
      this.formValueMap[KazaAuthPass1ValueKey] as String?;
  String? get kazaAuthPass2Value =>
      this.formValueMap[KazaAuthPass2ValueKey] as String?;

  set kazaAuthMailValue(String? value) {
    this.setData(
      this.formValueMap..addAll({KazaAuthMailValueKey: value}),
    );

    if (_KazaViewTextEditingControllers.containsKey(KazaAuthMailValueKey)) {
      _KazaViewTextEditingControllers[KazaAuthMailValueKey]?.text = value ?? '';
    }
  }

  set kazaAuthPass1Value(String? value) {
    this.setData(
      this.formValueMap..addAll({KazaAuthPass1ValueKey: value}),
    );

    if (_KazaViewTextEditingControllers.containsKey(KazaAuthPass1ValueKey)) {
      _KazaViewTextEditingControllers[KazaAuthPass1ValueKey]?.text =
          value ?? '';
    }
  }

  set kazaAuthPass2Value(String? value) {
    this.setData(
      this.formValueMap..addAll({KazaAuthPass2ValueKey: value}),
    );

    if (_KazaViewTextEditingControllers.containsKey(KazaAuthPass2ValueKey)) {
      _KazaViewTextEditingControllers[KazaAuthPass2ValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasKazaAuthMail =>
      this.formValueMap.containsKey(KazaAuthMailValueKey) &&
      (kazaAuthMailValue?.isNotEmpty ?? false);
  bool get hasKazaAuthPass1 =>
      this.formValueMap.containsKey(KazaAuthPass1ValueKey) &&
      (kazaAuthPass1Value?.isNotEmpty ?? false);
  bool get hasKazaAuthPass2 =>
      this.formValueMap.containsKey(KazaAuthPass2ValueKey) &&
      (kazaAuthPass2Value?.isNotEmpty ?? false);

  bool get hasKazaAuthMailValidationMessage =>
      this.fieldsValidationMessages[KazaAuthMailValueKey]?.isNotEmpty ?? false;
  bool get hasKazaAuthPass1ValidationMessage =>
      this.fieldsValidationMessages[KazaAuthPass1ValueKey]?.isNotEmpty ?? false;
  bool get hasKazaAuthPass2ValidationMessage =>
      this.fieldsValidationMessages[KazaAuthPass2ValueKey]?.isNotEmpty ?? false;

  String? get kazaAuthMailValidationMessage =>
      this.fieldsValidationMessages[KazaAuthMailValueKey];
  String? get kazaAuthPass1ValidationMessage =>
      this.fieldsValidationMessages[KazaAuthPass1ValueKey];
  String? get kazaAuthPass2ValidationMessage =>
      this.fieldsValidationMessages[KazaAuthPass2ValueKey];
}

extension Methods on FormStateHelper {
  setKazaAuthMailValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[KazaAuthMailValueKey] = validationMessage;
  setKazaAuthPass1ValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[KazaAuthPass1ValueKey] = validationMessage;
  setKazaAuthPass2ValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[KazaAuthPass2ValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    kazaAuthMailValue = '';
    kazaAuthPass1Value = '';
    kazaAuthPass2Value = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      KazaAuthMailValueKey: getValidationMessage(KazaAuthMailValueKey),
      KazaAuthPass1ValueKey: getValidationMessage(KazaAuthPass1ValueKey),
      KazaAuthPass2ValueKey: getValidationMessage(KazaAuthPass2ValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _KazaViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _KazaViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      KazaAuthMailValueKey: getValidationMessage(KazaAuthMailValueKey),
      KazaAuthPass1ValueKey: getValidationMessage(KazaAuthPass1ValueKey),
      KazaAuthPass2ValueKey: getValidationMessage(KazaAuthPass2ValueKey),
    });
