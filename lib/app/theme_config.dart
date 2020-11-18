import 'package:flutter_mobile_application/common/constants/theme_colors.dart';
import 'package:flutter/material.dart';

final ThemeData basicTheme = _buildBasicTheme();

TextTheme _buildTextTheme(TextTheme baseTextTheme) => baseTextTheme;

ThemeData _buildBasicTheme() {
  final ColorScheme colorScheme = const ColorScheme.dark().copyWith(
      primary: ThemeColors.primaryColor, secondary: ThemeColors.secondaryColor);

  final ThemeData base = ThemeData(
    primaryColor: ThemeColors.primaryColor,
    primaryColorDark: ThemeColors.primaryColor,
    primaryColorLight: ThemeColors.secondaryColor,
    indicatorColor: ThemeColors.accent,
    toggleableActiveColor: ThemeColors.secondaryColor,
    accentColor: ThemeColors.accent,
    errorColor: ThemeColors.red,
    buttonColor: ThemeColors.secondaryColor,
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
