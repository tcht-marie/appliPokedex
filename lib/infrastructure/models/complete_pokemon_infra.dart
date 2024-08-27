
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke/infrastructure/models/pokemon_stat_infra.dart';
import 'package:poke/infrastructure/models/pokemon_types_infra.dart';

import 'evolution_chain_infra.dart';

part 'complete_pokemon_infra.freezed.dart';
part 'complete_pokemon_infra.g.dart';

@freezed
class CompletePokemonInfra with _$CompletePokemonInfra {
  const factory CompletePokemonInfra({
    required int id,
    required String idLabel,
    required String name,
    required int weight,
    required String cries,
    required int height,
    required List<PokemonTypesInfra> pokemonTypes,
    required List<PokemonStatInfra> pokemonStat,
    required List<String> abilities,
    required EvolutionChainInfra evolutionChain
  }) = _CompletePokemonInfra;

  factory CompletePokemonInfra.fromJson(Map<String, Object?> json)
  => _$CompletePokemonInfraFromJson(json);
}