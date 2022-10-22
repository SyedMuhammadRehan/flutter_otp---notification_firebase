import 'package:flutter/material.dart';

import 'fontsmanager.dart';

TextStyle _getTextStyle(
    double fontSize, FontWeight fontWeight, Color color, String fontFamily) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: fontFamily);
}

TextStyle _getTextStyle2(
    double fontSize, FontWeight fontWeight, Color color, FontStyle? fontStyle) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontStyle: fontStyle);
}

TextStyle regularTextStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontWeightManager.regular, color, FontConstants.fontFamily);
}

TextStyle regularTextStyle2({
  double fontSize = FontSize.s14,
  required Color color,
}) {
  return _getTextStyle(
      fontSize, FontWeightManager.semiBold, color, FontConstants.fontFamily);
}

TextStyle lightTextStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontWeightManager.light, color, FontConstants.fontFamily);
}

TextStyle mediumTextStyle(
    {double fontSize = FontSize.s14, required Color color}) {
  return _getTextStyle(
      fontSize, FontWeightManager.medium, color, FontConstants.fontFamily);
}

TextStyle semiBoldTextStyle(
    {double fontSize = FontSize.s16, required Color color}) {
  return _getTextStyle(
      fontSize, FontWeightManager.semiBold, color, FontConstants.fontFamily);
}

TextStyle boldTextStyle(
    {double fontSize = FontSize.s20, required Color color}) {
  return _getTextStyle(
      fontSize, FontWeightManager.bold, color, FontConstants.fontFamily);
}

TextStyle mediumTextStyle2(
    {double fontSize = FontSize.s12,
    required Color color,
    required FontStyle fontStyle}) {
  return _getTextStyle2(fontSize, FontWeightManager.regular, color, fontStyle);
}
