import 'package:poke/domain/models/pokemon.dart';
import 'package:poke/domain/models/pokemon_types.dart';

typedef MoveDetails = ({
  String name,
  int power,
  int pp,
  PokemonTypes pokemonTypes,
  String flavorText,
  List<Pokemon> pokemons,
});
