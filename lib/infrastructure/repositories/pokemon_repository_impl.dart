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
  // initialisation de Dio avec l'url de base
  final dio = Dio(BaseOptions(baseUrl: 'http://localhost:8080/pokemons'));

  final PokemonMapper pokemonMapper;

  // constructeur
  PokemonRepositoryImpl(this.pokemonMapper);

  @override
  Future<List<Pokemon>> findPokemonsByPage(
      {required int limit, required int offset}) async {
    Response response =
        // appel au back (baseUrl) pour récup pokemon avec pagination
        await dio.get("", queryParameters: {"limit": limit, "offset": offset});
    // si appel ok et non null
    if (response.statusCode == 200 && response.data != null) {
      // si les data sont une liste
      return response.data is List
          // alors on les traite comme une liste (== liste d'objet json)
          ? (response.data as List<dynamic>)
              // transformation de chaque élément json en objet pokemonInfra
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
          // sinon return une liste vide (si les data ne sont pas une liste)
          : [];
    } else {
      throw Exception("erreur lors de la récupération du pokedex");
    }
  }

  @override
  Future<CompletePokemon> findPokemonById({required int id}) async {
    // appel au back pour recup un pokemon par son id
    Response response = await dio.get("/pokemon/$id");
    if (response.statusCode == 200 && response.data != null) {
      // transformation des data jason en objet CompletePokemonInfra
      CompletePokemonInfra completePokemonInfra =
          CompletePokemonInfra.fromJson(response.data);

      // transformation des types de pokemon
      List<PokemonTypes> pokemonTypes = completePokemonInfra.pokemonTypes
          .map((element) =>
              pokemonMapper.pokemonTypesInfraToPokemonTypes(element))
          .toList(growable: false);

      // transformation des stats de pokemon
      List<PokemonStat> pokemonStat = completePokemonInfra.pokemonStat
          .map((element) => (
                baseStat: element.baseStat,
                statName:
                    pokemonMapper.statNameInfraToStatName(element.statName)
              ))
          .toList(growable: false);

      // transformation de la chaine d'evolution
      EvolutionChain evoChain = pokemonMapper
          .evoChainInfraToEvoChain(completePokemonInfra.evolutionChain);

      // return un objet CompletePokemon avec toutes les data transformées
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
    // appel au back pour récup les versions
    Response response = await dio.get("/versions");
    if (response.statusCode == 200 && response.data != null) {
      // si les données sont une liste
      return response.data is List
          ? (response.data as List<dynamic>)
              // transformation de chaque élément json en VersionInfra
              .map<VersionInfra>((element) => VersionInfra.fromJson(element))
              // transformation de chaque VersionInfra en Version (domain)
              .map<Version>((element) => (name: element.name, url: element.url))
              // conversion en liste fixe
              .toList(growable: false)
          // si les données ne sont pas une liste, return une liste vide
          : [];
    } else {
      throw Exception("erreur lors de la récupération des versions");
    }
  }

  @override
  Future<List<ItemDetails>> findItemDetailsByPage({required int limit, required int offset}) async {
    // appel au back pour récup la liste des ItemDetails avec pagination
    Response response = await dio.get("/items?limit=$limit&offset=$offset");
    if (response.statusCode == 200 && response.data != null) {
      return response.data is List
          ? (response.data as List<dynamic>)
              .map<ItemDetailsInfra>(
                  (element) => ItemDetailsInfra.fromJson(element))
              .map<ItemDetails>((element) => (
                    spriteUrl: element.spriteUrl,
                    name: element.name,
                    id: element.id,
                    effect: element.effect,
                    category: element.category
                  ))
              .toList(growable: false)
          : [];
    } else {
      throw Exception("erreur lors de la récupération des items");
    }
  }

  @override
  Future<List<MoveDetails>> findMoveDetailsByPage(int limit, int offset) async {
    // appel au back pour récup une liste de MoveDetails avec pagination
    Response response = await dio.get("/moves?limit=$limit&offset=$offset");
    if (response.statusCode == 200 && response.data != null) {
      return response.data is List
          ? (response.data as List<dynamic>)
              .map<MoveDetailsInfra>(
                  (element) => MoveDetailsInfra.fromJson(element))
              .map<MoveDetails>((element) => (
                    name: element.name,
                    power: element.power,
                    pp: element.pp,
                    pokemonTypes: pokemonMapper.pokemonTypesInfraToPokemonTypes(element.pokemonTypes),
                    flavorText: element.flavorText,
                    pokemons: element.pokemons
                        .map((element) => pokemonMapper.pokemonInfraToPokemon(element)).toList(growable: false)
                  ))
              .toList(growable: false)
          : [];
    } else {
      throw Exception("erreur lors de la récupération des moves");
    }
  }
}
