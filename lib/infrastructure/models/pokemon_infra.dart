
import 'package:freezed_annotation/freezed_annotation.dart';
part 'pokemon_infra.freezed.dart';
part 'pokemon_infra.g.dart';

@freezed
class PokemonInfra with _$PokemonInfra {
  const factory PokemonInfra({
    required int id,
    required String idLabel,
    required String name,
    required String imageUrl
  }) = _PokemonInfra;

  factory PokemonInfra.fromJson(Map<String, Object?> json)
  => _$PokemonInfraFromJson(json);
}