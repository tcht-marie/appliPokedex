
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke/infrastructure/models/pokemon_infra.dart';
import 'package:poke/infrastructure/models/pokemon_types_infra.dart';
part 'move_details_infra.freezed.dart';
part 'move_details_infra.g.dart';

@freezed
class MoveDetailsInfra with _$MoveDetailsInfra {
  const factory MoveDetailsInfra({
    required String name,
    required int power,
    required int pp,
    required PokemonTypesInfra pokemonTypes,
    required String flavorText,
    required List<PokemonInfra> pokemons
  }) = _MoveDetailsInfra;

factory MoveDetailsInfra.fromJson(Map<String, Object?> json)
=> _$MoveDetailsInfraFromJson(json);
}