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
  final Dio dio;

  final PokemonMapper pokemonMapper;

  // constructeur
  PokemonRepositoryImpl(this.pokemonMapper, this.dio);

  /*@override
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
  }*/
  @override
  Future<List<Pokemon>> findPokemonsByPage(
      {required int limit, required int offset}) async {
    //appel à la méthode factorisée popur récup pokemon avec pagination
    return _pokemonInfraToPokemon("/pokemons",
        queryParameters: {"limit": limit, "offset": offset});
  }

  // méthode factorisée pour les deux méthodes : findPokemonsByPage & searchPokedexByName
  Future<List<Pokemon>> _pokemonInfraToPokemon(String endPoint,
      {Map<String, dynamic>? queryParameters}) async {
    Response response =
        // appel au back avec en paramètre un endpoint et des queryparams
        await dio.get(endPoint, queryParameters: queryParameters);
    // si appel ok et non null
    if (response.statusCode == 200 && response.data != null) {
      // si les data sont une liste
      return response.data is List
          //on les traîte comme une liste (== liste d'objet json)
          ? (response.data as List<dynamic>)
              // transformation de chaque éléments json en objet pokemonInfra
              .map<PokemonInfra>((element) => PokemonInfra.fromJson(element))
              // transformation de pokemonInfra en Pokemon
              .map<Pokemon>((element) => (
                    id: element.id,
                    idLabel: element.idLabel,
                    name: element.name,
                    imageUrl: element.imageUrl
                  ))
              // convertit en liste
              .toList(growable: false)
          // si data null = retourne une liste vide
          : [];
    } else {
      throw Exception("erreur lors de la récupération du pokedex");
    }
  }

  @override
  Future<List<Pokemon>> searchPokedexByName(
      {required int limit, required int offset, required String query}) async {
    // appel à la méthode factorisée pour recherche pokemon par name
    return _pokemonInfraToPokemon("/pokemons/search",
        queryParameters: {"limit": limit, "offset": offset, "query": query});
  }

  @override
  Future<CompletePokemon> findPokemonById({required int id}) async {
    // appel au back pour recup un pokemon par son id
    Response response = await dio.get("/pokemons/pokemon/$id");
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
        imageUrl: completePokemonInfra.imageUrl,
        flavorText: completePokemonInfra.flavorText,
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
    Response response = await dio.get("/pokemons/versions");
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
  Future<List<ItemDetails>> findItemDetailsByPage(
      {required int limit, required int offset}) async {
    // appel au back pour récup la liste des ItemDetails avec pagination
    Response response = await dio.get("/pokemons/items?limit=$limit&offset=$offset");
    if (response.statusCode == 200 && response.data != null) {
      return response.data is List
          ? (response.data as List<dynamic>)
              // transformation de chaque élément JSON en ItemDetailsInfra
              .map<ItemDetailsInfra>(
                  (element) => ItemDetailsInfra.fromJson(element))
              // transformation de chaque ItemDetailsInfra en ItemDetails
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
    Response response = await dio.get("/pokemons/moves?limit=$limit&offset=$offset");
    if (response.statusCode == 200 && response.data != null) {
      return response.data is List
          ? (response.data as List<dynamic>)
              // transformation de chaque élément JSON en MoveDetailsInfra
              .map<MoveDetailsInfra>(
                  (element) => MoveDetailsInfra.fromJson(element))
              // transformation de chaque MoveDetailsInfra en MoveDetails
              .map<MoveDetails>((element) => (
                    name: element.name,
                    power: element.power,
                    pp: element.pp,
                    // appel à une méthode du mapper pour faire correspondre les deux enums (Infra vers domain)
                    pokemonTypes: pokemonMapper
                        .pokemonTypesInfraToPokemonTypes(element.pokemonTypes),
                    flavorText: element.flavorText,
                    // list de pokemon = appel à la méthode de transformation de PokemonInfra en Pokemon mise dans le mapper pour factorisation du code
                    pokemons: element.pokemons
                        .map((element) =>
                            pokemonMapper.pokemonInfraToPokemon(element))
                        .toList(growable: false)
                  ))
              .toList(growable: false)
          : [];
    } else {
      throw Exception("erreur lors de la récupération des moves");
    }
  }

  @override
  Future<List<Pokemon>> findTrainerPokedex() async {
    Response response = await dio.get("/pokemons/pokedex/me");
    if (response.statusCode == 200 && response.data != null) {
      return response.data is List
          ? (response.data as List<dynamic>)
              .map<PokemonInfra>((element) => PokemonInfra.fromJson(element))
              .map<Pokemon>((element) => (
                    id: element.id,
                    idLabel: element.idLabel,
                    name: element.name,
                    imageUrl: element.imageUrl
                  ))
              .toList(growable: false)
          : [];
    } else {
      throw Exception("erreur lors de la récupération du pokedex");
    }
  }

  @override
  Future<Pokemon> addPokemonToPokedex({required int id}) async {
    Response response = await dio.post("/pokemons/pokedex/$id/me");
    if (response.statusCode == 200 && response.data != null) {
      PokemonInfra pokemon = PokemonInfra.fromJson(response.data);
      return (
        id: pokemon.id,
        idLabel: pokemon.idLabel,
        name: pokemon.name,
        imageUrl: pokemon.imageUrl
      );
    } else {
      throw Exception("Erreur lors de l'ajout du pokémon");
    }
  }

  @override
  Future<Pokemon> deletePokemon({required int id}) async {
    Response response = await dio.delete("/pokemons/pokedex/$id/me");
    if (response.statusCode == 200 && response.data != null) {
      PokemonInfra pokemon = PokemonInfra.fromJson(response.data);
      return (
        id: pokemon.id,
        idLabel: pokemon.idLabel,
        name: pokemon.name,
        imageUrl: pokemon.imageUrl
      );
    } else {
      throw Exception("Erreur lors de la suppression du pokémon");
    }
  }

  @override
  Future<void> deleteAllPokemons() async {
    Response response = await dio.delete("/pokemons/pokedex/me");
    response.statusCode == 200
        ? null
        : throw Exception("Erreur lors de la suppression du pokedex");
  }
}
