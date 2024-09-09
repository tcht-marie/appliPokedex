import 'package:flutter/cupertino.dart';
import 'package:poke/components/pokedex_box.dart';
import 'package:poke/domain/models/evolves_to.dart';
import 'package:poke/domain/models/pokemon.dart';

class EvoSpecies extends StatelessWidget {
  final EvolvesTo evolvesTo;

  const EvoSpecies({super.key, required this.evolvesTo});

  List<Pokemon> chain(List<Pokemon> pokemons, EvolvesTo evo) {
    pokemons.add(evolvesTo.pokemon);
    evolvesTo.evolvesTo
        .map((element) => chain(pokemons, element))
        .toList(growable: true);
    return pokemons;
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      children: chain([], evolvesTo)
          .map((element) => PokedexBox(
              idLabel: element.idLabel,
              name: element.name,
              imageUrl: element.imageUrl))
          .toList(growable: true),
    );
  }
}
