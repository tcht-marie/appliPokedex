import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poke/config/app_bar_theme.dart';
import 'package:poke/config/text_theme.dart';

import 'colors.dart';

class ThemeConfig {
  /// constructeur privé pour empêcher l'instanciation de la classe
  ThemeConfig._();

  static ThemeData createTheme() {
    /// structure le thème texte
    final baseTextTheme =
        Typography.whiteMountainView.merge(Typography.englishLike2021);

    /// point de départ du thème
    final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: PokedexColors.grayScale[000]!,
        brightness: Brightness.light,
        surfaceTint: Colors.transparent,
        surface: PokedexColors.grayScale[100]!);

    /// appliquer la font poppins
    final TextTheme textTheme = GoogleFonts.poppinsTextTheme(
      TextThemeConfig.textTheme(baseTextTheme, colorScheme),
    );

    /// crée un thème pour l'appbar en utilisant la config définie dans AppBarThemeConfig
    final AppBarTheme appBarTheme = AppBarThemeConfig.appBarTheme(textTheme);

    /// return un themeData configuré avec le thème texte, thème de l'appbar et l'utilisation de material 3
    return ThemeData(
        textTheme: textTheme, appBarTheme: appBarTheme, useMaterial3: true);
  }
}

// crée un thème de texte en utilisant la config définie dans TexthemeConfig
/*final TextTheme textTheme =
        TextThemeConfig.textTheme(baseTextTheme, colorScheme);*/
