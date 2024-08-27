
import '../models/item_details.dart';
import '../models/move_details.dart';
import '../models/pokemon.dart';
import '../models/complete_pokemon.dart';
import '../models/version.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> findPokemonsByPage({required int limit, required int offset});

  Future<CompletePokemon> findPokemonById({required int id});

  Future<List<Version>> findVersions();

  Future<ItemDetails> findItemDetailsById({required int id});
  
  Future<MoveDetails> findMoveDetailsById(int id);
}