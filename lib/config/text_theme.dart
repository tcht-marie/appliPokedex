import 'package:flutter/material.dart';
import 'package:poke/config/colors.dart';

class TextThemeConfig {
  static TextTheme textTheme(TextTheme baseTextTheme, ColorScheme colorScheme) {

    final headline = TextStyle(
        fontWeight: FontWeight.w700, color: PokedexColors.grayScale[100]);

    final subtitle3 = TextStyle(
      fontWeight: FontWeight.w700,
      height: 10.0 / 16.0,
      fontSize: 16,
      color: PokedexColors.grayScale[100],
    );

    const subtitle2 = TextStyle(
      fontWeight: FontWeight.w700,
      height: 12.0 / 16.0,
      fontSize: 16,
    );

    const subtitle1 = TextStyle(
      fontWeight: FontWeight.w700,
      height: 14.0 / 16.0,
      fontSize: 16,
    );

    final body3 = TextStyle(
      height: 10.0 / 16.0,
      fontSize: 16,
      color: colorScheme.primary,
    );

    const body2 = TextStyle(
      height: 12.0 / 16.0,
      fontSize: 16,
    );

    const body1 = TextStyle(
      height: 14.0 / 16.0,
      fontSize: 16,
    );

    final caption = TextStyle(
      height: 8.0 / 12.0,
      fontSize: 12,
      color: PokedexColors.grayScale[025],
    );

    return TextTheme(
      headlineSmall: headline,
      bodyLarge: body1,
      bodyMedium: body2,
      bodySmall: body3,
      titleLarge: subtitle1,
      titleMedium: subtitle2,
      titleSmall: subtitle3,
      labelSmall: caption,
    );
  }
}
