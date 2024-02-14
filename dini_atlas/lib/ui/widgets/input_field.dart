import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    this.controller,
    this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.errorText,
    this.padding,
    this.onSubmit,
    this.focusNode,
  });
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? errorText;
  final EdgeInsetsGeometry? padding;
  final Function(String value)? onSubmit;
  final FocusNode? focusNode;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _hidePassword = true;
  void _setHidePassword() => setState(() => _hidePassword = !_hidePassword);

  @override
  void initState() {
    super.initState();
    _hidePassword = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: _hidePassword,
      onFieldSubmitted: widget.onSubmit,
      style: const TextStyle(color: kcPrimaryColorDark),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        errorText: widget.errorText,
        errorStyle: const TextStyle(fontSize: 12, color: kcPrimaryColor),
        suffixIcon: !widget.obscureText
            ? null
            : IconButton(
                onPressed: () => _setHidePassword(),
                icon: Icon(
                  _hidePassword
                      ? Icons.remove_red_eye
                      : Icons.remove_red_eye_outlined,
                  color: kcGrayColor,
                  size: 22,
                ),
              ),
        contentPadding: widget.padding ??
            const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        isDense: true,
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontSize: 16,
          color: kcGrayColor,
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        fillColor: kcGrayColorLightSoft,
      ),
    );
  }
}
