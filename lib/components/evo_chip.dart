import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke/domain/models/complete_pokemon.dart';

import '../config/colors.dart';
import 'evo_species.dart';

class EvoChip extends StatelessWidget {
  final CompletePokemon pokemon;

  const EvoChip({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return ActionChip(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        side: BorderSide(
          width: 1,
          color: PokedexColors.colorTypes(pokemon.pokemonTypes.first),
        ),
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: PokedexColors.grayScale[100],
              context: context,
              builder: (BuildContext context) {
                return EvoSpecies(evolvesTo: pokemon.evolutionChain.evolvesTo);
              });
        },
        label: Text('Evolutions',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: PokedexColors.colorTypes(pokemon.pokemonTypes.first))));
  }
}
