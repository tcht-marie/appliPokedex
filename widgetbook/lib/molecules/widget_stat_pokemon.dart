
import 'package:flutter/cupertino.dart';
import 'package:poke/components/stat_pokemon.dart';
import 'package:poke/domain/models/pokemon_stat.dart';
import 'package:poke/domain/models/pokemon_types.dart';
import 'package:poke/domain/models/stat_name.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Pokemon Stat', type: StatPokemon)
Widget buildStatPokemonUseCase(BuildContext context) {

  StatName statName = context.knobs.list(
      label: "Stats",
      options: StatName.values
  );

  PokemonTypes types = context.knobs.list(
      label: 'Types',
      options: PokemonTypes.values
  );

  int baseStat = context.knobs.double.slider(
      label: 'Base Stat',
      initialValue: 50,
      min: 0,
      max: 250
  ).toInt();

  List<PokemonStat> pokemonStats = ([baseStat, statName]);

  return StatPokemon(pokemonStats: pokemonStats, types: types);
}