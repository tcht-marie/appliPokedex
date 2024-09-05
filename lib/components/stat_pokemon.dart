import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke/components/linear_stat.dart';
import 'package:poke/domain/models/pokemon_stat.dart';
import 'package:poke/domain/models/pokemon_types.dart';

import '../config/colors.dart';

class StatPokemon extends StatelessWidget {
  final List<PokemonStat> pokemonStats;
  final PokemonTypes types;

  const StatPokemon(
      {super.key, required this.pokemonStats, required this.types});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: pokemonStats
          .map((element) => Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: PokedexColors.colorTypes(types),
                                  ),
                          textAlign: TextAlign.end,
                          element.statName.value),
                    ),
                  ),
                  Container(
                    width: 1.5,
                    height: 20,
                    color: PokedexColors.grayScale[050],
                    margin: const EdgeInsets.only(left: 15),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.start,
                          element.baseStat.toString()),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: LinearStat(
                          value: element.baseStat.toDouble(), types: types),
                    ),
                  ),
                ],
              ))
          .toList(growable: false),
    );
  }
}
