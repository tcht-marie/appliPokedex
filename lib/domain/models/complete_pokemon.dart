import 'package:poke/domain/models/pokemon_stat.dart';
import 'package:poke/domain/models/pokemon_types.dart';

import 'evolution_chain.dart';

typedef CompletePokemon = ({
  int id,
  String idLabel,
  String name,
  String weight,
  String cries,
  String height,
  String imageUrl,
  String flavorText,
  List<PokemonTypes> pokemonTypes,
  List<PokemonStat> pokemonStat,
  List<String> abilities,
  EvolutionChain evolutionChain
});
