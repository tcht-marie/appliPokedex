import 'package:flutter/material.dart';
import 'package:poke/config/text_theme.dart';

import 'colors.dart';

class ThemeConfig {
  ThemeConfig._();

  static ThemeData createTheme() {
    final baseTextTheme = Typography.whiteMountainView.merge(
        Typography.englishLike2021);

    final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: PokedexColors.grayScale[000]!,
        brightness: Brightness.light,
        surfaceTint: Colors.transparent,
        surface: PokedexColors.grayScale[100]!
    );

    final TextTheme textTheme = TextThemeConfig.textTheme(baseTextTheme, colorScheme);

    return ThemeData(textTheme: textTheme);
  }
}