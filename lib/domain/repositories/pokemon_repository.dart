
import '../models/item_details.dart';
import '../models/move_details.dart';
import '../models/pokemon.dart';
import '../models/complete_pokemon.dart';
import '../models/version.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> findPokemonsByPage({required int limit, required int offset});

  Future<List<Pokemon>> searchPokedexByName({required int limit, required int offset, required String query});

  Future<CompletePokemon> findPokemonById({required int id});

  Future<List<Version>> findVersions();

  Future<List<ItemDetails>> findItemDetailsByPage({required int limit, required int offset});
  
  Future<List<MoveDetails>> findMoveDetailsByPage(int limit, int offset);

  Future<List<Pokemon>> findTrainerPokedex();

  Future<Pokemon> addPokemonToPokedex({required int id});

  Future<Pokemon> deletePokemon({required int id});

  Future<void> deleteAllPokemons();
}