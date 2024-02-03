import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class AppTheme {
  static void setStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ));
  }

  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: "Poppins",
      appBarTheme: _appbarTheme(),
      colorScheme: const ColorScheme.light(
        background: kcBackgroundColor,
        onBackground: kcOnBackgroundColor,
        primary: kcPrimaryColor,
        shadow: kcShadowColor,
      ),
      textTheme: _textTheme(),
      dividerTheme: const DividerThemeData(color: kcDividerColor),
    );
  }

  static TextTheme _textTheme() {
    return const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: kcOnBackgroundColor,
      ),
    );
  }

  static AppBarTheme _appbarTheme() {
    return const AppBarTheme(
      backgroundColor: kcBackgroundColor,
      elevation: 0,
      iconTheme: IconThemeData(color: kcOnBackgroundColor),
    );
  }
}
