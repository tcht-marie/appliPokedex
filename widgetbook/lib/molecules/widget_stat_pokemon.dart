import 'package:flutter/material.dart';
import 'package:poke/components/molecules/stat_pokemon.dart';
import 'package:poke/domain/models/pokemon_stat.dart';
import 'package:poke/domain/models/pokemon_types.dart';
import 'package:poke/domain/models/stat_name.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Pokemon Stat', type: StatPokemon)
Widget buildStatPokemonUseCase(BuildContext context) {
  StatName statName =
      context.knobs.list(label: "Stats", options: StatName.values);

  PokemonTypes types =
      context.knobs.list(label: 'Types', options: PokemonTypes.values);

  int baseStat = context.knobs.int
      .slider(label: 'Base Stat', initialValue: 50, min: 0, max: 250)
      .toInt();

  List<PokemonStat> pokemonStats = [(baseStat: baseStat, statName: statName)];

  return Scaffold(
    body: Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StatPokemon(pokemonStats: pokemonStats, types: types),
        StatPokemon(pokemonStats: pokemonStats, types: PokemonTypes.psychic),
        StatPokemon(pokemonStats: pokemonStats, types: PokemonTypes.grass),
      ],
    )),
  );
}
