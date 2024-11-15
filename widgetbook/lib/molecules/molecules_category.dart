
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_workspace/molecules/widget_features.dart';
import 'package:widgetbook_workspace/molecules/widget_pokedex_box.dart';
import 'package:widgetbook_workspace/molecules/widget_search_pokemon.dart';
import 'package:widgetbook_workspace/molecules/widget_stat_pokemon.dart';

final moleculesCategory = WidgetbookPackage(
    name: 'Molecules',
    children: [
      WidgetbookUseCase(
          name: 'Features',
          builder: (context) => buildFeaturesUseCase(context)),
      WidgetbookUseCase(
          name: 'Pokedex box',
          builder: (context) => buildPokedexBoxUseCase(context)),
      WidgetbookUseCase(
          name: 'Search pokemon',
          builder: (context) => buildSearchPokemonUseCase(context)),
      WidgetbookUseCase(
          name: 'Stat pokemon',
          builder: (context) => buildStatPokemonUseCase(context))
    ]
);