import 'package:flutter/cupertino.dart';
import 'package:poke/components/molecules/pokedex_box.dart';
import 'package:poke/domain/models/evolves_to.dart';
import 'package:poke/domain/models/pokemon.dart';

class EvoSpecies extends StatelessWidget {
  // propriété pour stocker les infos d'évo
  final EvolvesTo evolvesTo;

  const EvoSpecies({super.key, required this.evolvesTo});

  // fonction récursive pour créer l'evo chain
  List<Pokemon> chain(List<Pokemon> pokemons, EvolvesTo evo) {
    // ajoute le pokemon actuel à la liste
    pokemons.add(evo.pokemon);
    // parcourt les evo et les ajoute à la liste
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
              id: element.id,
              idLabel: element.idLabel,
              name: element.name,
              imageUrl: element.imageUrl))
          .toList(growable: true),
    );
  }
}
