import 'package:flutter_mobile_application/common/constants/theme_colors.dart';
import 'package:flutter/material.dart';

class BackgroundStyle {
  const BackgroundStyle();

  static Decoration getGradientBackground() => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [ThemeColors.primaryColor, ThemeColors.secondaryColor],
        ),
      );
}
