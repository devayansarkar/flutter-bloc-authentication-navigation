import 'package:flutter/material.dart';
import 'package:flutter_mobile_application/common/constants/themeColors.dart';

final ThemeData basicTheme = _buildBasicTheme();

TextTheme _buildTextTheme(TextTheme base) {
  return base;
}

ThemeData _buildBasicTheme() {
  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: ThemeColors.primaryColor,
    secondary: ThemeColors.secondaryColor,
  );
  final ThemeData base = ThemeData(
    primaryColor: ThemeColors.primaryColor,
    primaryColorLight: ThemeColors.secondaryColor,
    buttonColor: ThemeColors.primaryColor,
    indicatorColor: Colors.white,
    toggleableActiveColor: ThemeColors.primaryColor,
    accentColor: ThemeColors.secondaryColor,
    errorColor: Colors.red,
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    ),
  );
  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildTextTheme(base.accentTextTheme),
  );
}
