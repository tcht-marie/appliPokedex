import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke/components/evo_chip.dart';
import 'package:poke/domain/models/complete_pokemon.dart';
import 'package:poke/domain/models/evolution_chain.dart';
import 'package:poke/domain/models/evolves_to.dart';
import 'package:poke/domain/models/pokemon.dart';
import 'package:poke/domain/models/pokemon_types.dart';
import 'package:poke/domain/models/stat_name.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Evo species', type: EvoChip)
Widget buildEvoSpeciesUseCase(BuildContext context) {
  Pokemon bulbi = (
    id: 1,
    idLabel: "#0001",
    name: "Bulbasaur",
    imageUrl:
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png"
  );
  Pokemon ivysaur = (
    id: 2,
    idLabel: "#0002",
    name: "Ivysaur",
    imageUrl:
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png"
  );
  Pokemon venusaur = (
    id: 3,
    idLabel: "#0003",
    name: "Venusaur",
    imageUrl:
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png"
  );
  EvolvesTo evolvesTo = EvolvesTo([
    EvolvesTo([EvolvesTo([], venusaur)], ivysaur)
  ], bulbi);
  CompletePokemon bulbasaur = (
    id: 1,
    idLabel: "#0001",
    name: "Bulbasaur",
    weight: "6,9",
    cries:
        "https://raw.githubusercontent.com/PokeAPI/cries/main/cries/pokemon/latest/1.ogg",
    height: "0,7",
    imageUrl:
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
    flavorText:
        "A strange seed was planted on its back at birth. The plant sprouts and grows with this POKéMON.",
    pokemonTypes: [PokemonTypes.grass, PokemonTypes.poison],
    pokemonStat: [
      (baseStat: 45, statName: StatName.hp),
      (baseStat: 49, statName: StatName.atk),
      (baseStat: 49, statName: StatName.def),
      (baseStat: 65, statName: StatName.satk),
      (baseStat: 65, statName: StatName.sdef),
      (baseStat: 45, statName: StatName.spd)
    ],
    abilities: ["Overgrow", "Chlorophyll"],
    evolutionChain: (evolvesTo: evolvesTo)
  );
  return Scaffold(
    body: Center(child: EvoChip(pokemon: bulbasaur)
        //EvoSpecies(evolvesTo: evolvesTo),
        ),
  );
}
