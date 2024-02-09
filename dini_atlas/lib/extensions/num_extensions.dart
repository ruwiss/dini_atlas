import 'dart:math';

extension DoubleExtensions on double {
  double degreesToRadians() {
    return this * (pi / 180.0);
  }

  double radiansToDegrees() {
    return this * (180.0 / pi);
  }
}
