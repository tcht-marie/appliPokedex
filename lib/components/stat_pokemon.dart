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
          .map(
            (element) => Row(
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.all(5),
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: Colors.grey
                          )
                        )
                      ),
                      child: Text(
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: PokedexColors.colorTypes(types),
                        ),
                          textAlign: TextAlign.center,
                          element.statName.value
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                        textAlign: TextAlign.center,
                        element.baseStat.toString()),
                  ),
                ),
                //const Spacer(),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: LinearStat(
                        value: element.baseStat.toDouble(), types: types),
                  ),
                ),
              ],
            ),
          )
          .toList(growable: false),
    );
  }
}
