import '../models/complete_pokemon.dart';
import '../models/item_details.dart';
import '../models/move_details.dart';
import '../models/pokemon.dart';
import '../models/version.dart';

abstract class PokemonService {
  Future<List<Pokemon>> getPokemonsByPage({required int limit, required int offset});

  Future<List<Pokemon>> getPokedexByName({required int limit, required int offset, required String query});

  Future<CompletePokemon> getPokemonById({required int id});

  Future<List<Version>> getVersions();

  Future<List<ItemDetails>> getItemDetailsByPage({required int limit, required int offset});

  Future<List<MoveDetails>> getMoveDetailsByPage(int limit, int offset);

  Future<List<Pokemon>> getTrainerPokedex();

  Future<Pokemon> addPokemonToPokedexTrainer(int id);

  Future<Pokemon> deletePokemonToPokedexTrainer(int id);

  Future<void> deleteAllPokemonsToPokedexTrainer();
}