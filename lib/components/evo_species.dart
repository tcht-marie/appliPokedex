import 'package:flutter/cupertino.dart';
import 'package:poke/components/pokedex_box.dart';
import 'package:poke/domain/models/evolves_to.dart';
import 'package:poke/domain/models/pokemon.dart';

class EvoSpecies extends StatelessWidget {
  final EvolvesTo evolvesTo;

  const EvoSpecies({super.key, required this.evolvesTo});

  List<Pokemon> chain(List<Pokemon> pokemons, EvolvesTo evo) {
    pokemons.add(evo.pokemon);
    for (var element in evo.evolvesTo) {
      chain(pokemons, element);
    }
    return pokemons;
  }
  /*List<Pokemon> chain(List<Pokemon> pokemons, EvolvesTo evo) {
    pokemons.add(evolvesTo.pokemon);
    evolvesTo.evolvesTo
        .map((element) => chain(pokemons, element))
        .toList(growable: true);
    return pokemons;
  }*/

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.symmetric(vertical: 25),
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
