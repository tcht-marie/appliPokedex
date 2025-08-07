import 'package:flutter/material.dart';
import '../config/colors.dart';

class AppBarThemeConfig {
  static AppBarTheme appBarTheme(TextTheme textTheme) {
    return AppBarTheme(
        titleTextStyle: textTheme.headlineSmall,
        backgroundColor: PokedexColors.identity);
  }
}
