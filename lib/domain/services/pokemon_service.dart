import '../models/complete_pokemon.dart';
import '../models/item_details.dart';
import '../models/move_details.dart';
import '../models/pokemon.dart';
import '../models/version.dart';

abstract class PokemonService {
  Future<CompletePokemon> getPokemonById({required int id});

  Future<List<Pokemon>> getPokemonsByPage({required int limit, required int offset});

  Future<List<Version>> getVersions();

  Future<ItemDetails> getItemDetailsById({required int id});

  Future<MoveDetails> getMoveDetailsById(int id);
}