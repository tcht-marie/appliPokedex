import 'package:flutter/cupertino.dart';
import 'package:poke/domain/models/pokemon_stat.dart';
import 'package:poke/domain/models/stat_name.dart';

class StatPokemon extends StatelessWidget {
  final List<PokemonStat> pokemonStats;

  const StatPokemon({super.key, required this.pokemonStats});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: pokemonStats
          .map((element) => Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(element.statName.value),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(element.baseStat.toString()),
                  ),
                ],
              ))
          .toList(growable: false),
    );
  }
}
