import 'dart:math';

import 'package:flutter/material.dart';

const double _tinySize = 5.0;
const double _smallSize = 10.0;
const double _mediumSize = 25.0;
const double _largeSize = 50.0;
const double _massiveSize = 120.0;

/// 5.0
const Widget horizontalSpaceTiny = SizedBox(width: _tinySize);

/// 10.0
const Widget horizontalSpaceSmall = SizedBox(width: _smallSize);

/// 25.0
const Widget horizontalSpaceMedium = SizedBox(width: _mediumSize);

/// 50.0
const Widget horizontalSpaceLarge = SizedBox(width: _largeSize);

/// 5.0
const Widget verticalSpaceTiny = SizedBox(height: _tinySize);

/// 10.0
const Widget verticalSpaceSmall = SizedBox(height: _smallSize);

/// 25.0
const Widget verticalSpaceMedium = SizedBox(height: _mediumSize);

/// 50.0
const Widget verticalSpaceLarge = SizedBox(height: _largeSize);

/// 120.0
const Widget verticalSpaceMassive = SizedBox(height: _massiveSize);

/// 5.0
BorderRadius borderRadiusSmall = BorderRadius.circular(5);

/// 10.0
BorderRadius borderRadiusMedium = BorderRadius.circular(10);

/// 30.0
BorderRadius borderRadiusLarge = BorderRadius.circular(30);

Widget spacedDivider = const Column(
  children: <Widget>[
    verticalSpaceMedium,
    Divider(color: Colors.blueGrey, height: 5.0),
    verticalSpaceMedium,
  ],
);

Widget verticalSpace(double height) => SizedBox(height: height);

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0, double max = 3000}) =>
    min((screenHeight(context) - offsetBy) / dividedBy, max);

double screenWidthFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0, double max = 3000}) =>
    min((screenWidth(context) - offsetBy) / dividedBy, max);

double halfScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 2);

double thirdScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 3);

double quarterScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 4);

double getResponsiveHorizontalSpaceMedium(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 10);
double getResponsiveSmallFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 14, max: 15);

double getResponsiveMediumFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 16, max: 17);

double getResponsiveLargeFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 21, max: 31);

double getResponsiveExtraLargeFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 25);

double getResponsiveMassiveFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 30);

double getResponsiveFontSize(BuildContext context,
    {double? fontSize, double? max}) {
  max ??= 100;

  var responsiveSize = min(
      screenWidthFraction(context, dividedBy: 10) * ((fontSize ?? 100) / 100),
      max);

  return responsiveSize;
}
