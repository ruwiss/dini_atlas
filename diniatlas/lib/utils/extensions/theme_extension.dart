import 'package:diniatlas/core/settings/theme/light_theme.dart';
import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => _lightTheme();
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;

  ThemeData _lightTheme() {
    return ThemeData(
      fontFamily: "Poppins",
      appBarTheme: _appbarTheme(),
      colorScheme: ColorScheme.light(
        background: LightTheme.background,
        onBackground: LightTheme.onBackground,
        primary: LightTheme.primary,
        primaryContainer: LightTheme.primaryContainer,
        inversePrimary: LightTheme.inversePrimary,
        secondary: LightTheme.secondary,
        secondaryContainer: LightTheme.secondaryContainer,
        tertiary: LightTheme.tertiary,
        surface: LightTheme.surface,
        onSurface: LightTheme.onSurface,
        surfaceVariant: LightTheme.surfaceVariant,
        shadow: LightTheme.shadow,
      ),
      textTheme: _textTheme(),
    );
  }

  TextTheme _textTheme() {
    return TextTheme(
        // Like OnBoarding Title
        displayLarge: TextStyle(
          color: LightTheme.primary,
          fontWeight: FontWeight.w700,
          fontSize: 28,
        ),
        // Like OnBoarding Subtitle
        displayMedium: TextStyle(
          fontSize: 18,
          color: LightTheme.onSurface,
          fontWeight: FontWeight.w400,
        ),
        // OnBackground Text 1
        bodyLarge: TextStyle(
          fontSize: 16,
          color: LightTheme.onSurface,
          fontWeight: FontWeight.w400,
        ),
        // OnBackground Text 2
        bodyMedium: TextStyle(
          fontSize: 15,
          color: LightTheme.onSurface,
          fontWeight: FontWeight.w500,
        ),
        // OnBackground Text 3
        bodySmall: TextStyle(
          fontSize: 12,
          color: LightTheme.onSurface,
          fontWeight: FontWeight.w400,
        ),
        // Like Menu Title
        labelLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: LightTheme.primaryContainer,
        ),
        // Like Tab Menu Title
        labelMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: LightTheme.primary,
        ),
        // Like Surah Title
        labelSmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: LightTheme.primaryContainer,
        ));
  }

  AppBarTheme _appbarTheme() {
    return AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: LightTheme.onSurface),
    );
  }
}
