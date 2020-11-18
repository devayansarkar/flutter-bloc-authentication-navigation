import 'package:flutter/material.dart';

class CustomTextStyle {
  const CustomTextStyle();

  static TextStyle getHeaderStyle([Color textColor = Colors.white]) =>
      TextStyle(
        color: textColor,
        fontWeight: FontWeight.bold,
        fontSize: 40,
      );

  static TextStyle getTitleStyle([Color textColor = Colors.white]) => TextStyle(
        color: textColor,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      );

  static TextStyle getSubtitleStyle([Color textColor = Colors.white]) =>
      TextStyle(color: textColor, fontSize: 16);
}
