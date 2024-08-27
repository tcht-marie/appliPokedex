import 'package:dio/dio.dart';
import 'package:poke/domain/models/evolution_chain.dart';
import 'package:poke/domain/models/item_details.dart';
import 'package:poke/domain/models/move_details.dart';
import 'package:poke/domain/models/pokemon.dart';
import 'package:poke/domain/models/complete_pokemon.dart';
import 'package:poke/domain/models/pokemon_stat.dart';
import 'package:poke/domain/models/pokemon_types.dart';
import 'package:poke/domain/models/version.dart';
import 'package:poke/domain/repositories/pokemon_repository.dart';
import 'package:poke/infrastructure/models/complete_pokemon_infra.dart';
import 'package:poke/infrastructure/models/item_details_infra.dart';
import 'package:poke/infrastructure/models/move_details_infra.dart';
import 'package:poke/infrastructure/models/pokemon_infra.dart';
import 'package:poke/infrastructure/models/version_infra.dart';

import 'mapper/pokemon_mapper.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final dio = Dio(BaseOptions(baseUrl: 'http://localhost:8080/pokemons'));

  final PokemonMapper pokemonMapper;

  PokemonRepositoryImpl(this.pokemonMapper);

  @override
  Future<List<Pokemon>> findPokemonsByPage(
      {required int limit, required int offset}) async {
    Response response =
        // appel au back (baseUrl) pour récup pokedex
        await dio.get("", queryParameters: {"limit": limit, "offset": offset});
    // si appel ok et non null
    if (response.statusCode == 200 && response.data != null) {
      // si les data sont une liste
      return response.data is List
          // alors on les traite comme une liste (== liste d'objet json)
          ? (response.data as List<dynamic>)
              // pour chaque objet de la liste, on le trasnforme en pokemonInfra
              .map<PokemonInfra>((element) => PokemonInfra.fromJson(element))
              // transforme chaque pokemonInfra en pokemon (domain)
              .map<Pokemon>((element) => (
                    id: element.id,
                    idLabel: element.idLabel,
                    name: element.name,
                    imageUrl: element.imageUrl
                  ))
              // convertit en liste (taille fixe)
              .toList(growable: false)
          // sinon return une liste vide
          : [];
    } else {
      throw Exception("erreur lors de la récupération du pokedex");
    }
  }

  @override
  Future<CompletePokemon> findPokemonById({required int id}) async {
    Response response = await dio.get("/pokemon/$id");
    if (response.statusCode == 200 && response.data != null) {
      CompletePokemonInfra completePokemonInfra =
          CompletePokemonInfra.fromJson(response.data);

      List<PokemonTypes> pokemonTypes = completePokemonInfra.pokemonTypes
          .map((element) =>
              pokemonMapper.pokemonTypesInfraToPokemonTypes(element))
          .toList(growable: false);

      List<PokemonStat> pokemonStat = completePokemonInfra.pokemonStat
          .map((element) => (
                baseStat: element.baseStat,
                statName:
                    pokemonMapper.statNameInfraToStatName(element.statName)
              ))
          .toList(growable: false);

      EvolutionChain evoChain = pokemonMapper
          .evoChainInfraToEvoChain(completePokemonInfra.evolutionChain);

      return (
        id: completePokemonInfra.id,
        idLabel: completePokemonInfra.idLabel,
        name: completePokemonInfra.name,
        weight: completePokemonInfra.weight,
        cries: completePokemonInfra.cries,
        height: completePokemonInfra.height,
        pokemonTypes: pokemonTypes,
        pokemonStat: pokemonStat,
        abilities: completePokemonInfra.abilities,
        evolutionChain: evoChain
      );
    } else {
      throw Exception("erreur lors de la récupération du pokemon");
    }
  }

  @override
  Future<List<Version>> findVersions() async {
    Response response = await dio.get("/versions");
    if (response.statusCode == 200 && response.data != null) {
      return response.data is List
          ? (response.data as List<dynamic>)
              .map<VersionInfra>((element) => VersionInfra.fromJson(element))
              .map<Version>((element) => (name: element.name, url: element.url))
              .toList(growable: false)
          : [];
    } else {
      throw Exception("erreur lors de la récupération des versions");
    }
  }

  @override
  Future<ItemDetails> findItemDetailsById({required int id}) async {
    Response response = await dio.get("/items/$id");
    if (response.statusCode == 200 && response.data != null) {
      ItemDetailsInfra itemDetailsInfra =
          ItemDetailsInfra.fromJson(response.data);

      return (
        spriteUrl: itemDetailsInfra.spriteUrl,
        name: itemDetailsInfra.name,
        id: itemDetailsInfra.id,
        effect: itemDetailsInfra.effect,
        category: itemDetailsInfra.category
      );
    } else {
      throw Exception("erreur lors de la récupération des items");
    }
  }

  @override
  Future<MoveDetails> findMoveDetailsById(int id) async {
    Response response = await dio.get("/moves/$id");
    if (response.statusCode == 200 && response.data != null) {
      MoveDetailsInfra moveDetailsInfra =
          MoveDetailsInfra.fromJson(response.data);

      PokemonTypes pokemonTypes = pokemonMapper
          .pokemonTypesInfraToPokemonTypes(moveDetailsInfra.pokemonTypes);

      List<Pokemon> pokemons = moveDetailsInfra.pokemons
          .map((element) => (pokemonMapper.pokemonInfraToPokemon(element)))
          .toList(growable: false);

      return (
        name: moveDetailsInfra.name,
        power: moveDetailsInfra.power,
        pp: moveDetailsInfra.pp,
        pokemonTypes: pokemonTypes,
        flavorText: moveDetailsInfra.flavorText,
        pokemons: pokemons
      );
    } else {
      throw Exception("erreur lors de la récupération des moves");
    }
  }
}
