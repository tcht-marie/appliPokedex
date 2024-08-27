
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke/infrastructure/models/stat_name_infra.dart';
part 'pokemon_stat_infra.freezed.dart';
part 'pokemon_stat_infra.g.dart';

@freezed
class PokemonStatInfra with _$PokemonStatInfra {
  const factory PokemonStatInfra({
    required int baseStat,
    required StatNameInfra statName
  }) = _PokemonStatInfra;

  factory PokemonStatInfra.fromJson(Map<String, Object?> json)
  => _$PokemonStatInfraFromJson(json);
}
