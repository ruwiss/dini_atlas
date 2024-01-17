import 'package:flutter/widgets.dart';

abstract class LightTheme {
  // Color Scheme
  static Color background = const Color(0xFFFFFFFF);
  static Color onBackground = const Color(0xFF8789A3);
  static Color primary = const Color(0xFF672CBC);
  static Color primaryContainer = const Color(0xFF364282);
  static Color inversePrimary = const Color(0xFFFFFFFF);
  static Color secondary = const Color(0xFF240F4F);
  static Color secondaryContainer = const Color(0xFFDF98FA);
  static Color tertiary = const Color(0xFF121931);
  static Color surface = const Color(0xFFF2F2F3);
  static Color onSurface = const Color(0xFF8789A3);
  static Color surfaceVariant = const Color(0xFFF1F4FA);
  static Color shadow = const Color(0xFFBAB0CE).withOpacity(.25);

  // Random Card Colors
  static List<Color> randomCardColors = [
    const Color(0xFF863ED5).withOpacity(.35),
    const Color(0xFF9055FF).withOpacity(.35),
    const Color(0xFFDF98FA).withOpacity(.35),
    const Color(0xFF7DB57C).withOpacity(.35),
    const Color(0xFFFFD08A).withOpacity(.35),
    const Color(0xFF669B67).withOpacity(.35),
    const Color(0xFFE29E51).withOpacity(.35),
    const Color(0xFF8390D4).withOpacity(.35),
    const Color(0xFFE29E51).withOpacity(.35),
    const Color(0xFFDFCBF4).withOpacity(.35),
    const Color(0xFFDF98FA).withOpacity(.35),
    const Color(0xFFECAABA).withOpacity(.35),
    const Color(0xFF863ED5).withOpacity(.35),
  ];
}
