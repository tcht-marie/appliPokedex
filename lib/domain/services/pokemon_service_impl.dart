import 'package:poke/domain/models/complete_pokemon.dart';
import 'package:poke/domain/models/item_details.dart';
import 'package:poke/domain/models/move_details.dart';
import 'package:poke/domain/models/pokemon.dart';
import 'package:poke/domain/models/version.dart';
import 'package:poke/domain/repositories/pokemon_repository.dart';
import 'package:poke/domain/services/pokemon_service.dart';

class PokemonServiceImpl implements PokemonService {

  final PokemonRepository pokemonRepository;

  PokemonServiceImpl(this.pokemonRepository);

  @override
  Future<CompletePokemon> getPokemonById({required int id}) {
    return pokemonRepository.findPokemonById(id: id);
  }

  @override
  Future<List<Pokemon>> getPokemonsByPage({required int limit, required int offset}) {
    return pokemonRepository.findPokemonsByPage(limit: limit, offset: offset);
  }
  
  @override
  Future<List<Version>> getVersions() {
    return pokemonRepository.findVersions();
  }

  @override
  Future<ItemDetails> getItemDetailsById({required int id}) {
    return pokemonRepository.findItemDetailsById(id: id);
  }

  @override
  Future<MoveDetails> getMoveDetailsById(int id) {
    return pokemonRepository.findMoveDetailsById(id);
  }

}