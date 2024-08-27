
import 'package:freezed_annotation/freezed_annotation.dart';

import 'pokemon_infra.dart';
part 'evolves_to_infra.freezed.dart';
part 'evolves_to_infra.g.dart';

@freezed
class EvolvesToInfra with _$EvolvesToInfra {

  const factory EvolvesToInfra({
    required List<EvolvesToInfra> evolvesTo,
    required PokemonInfra pokemon,
  }) = _EvolvesToInfra;

  factory EvolvesToInfra.fromJson(Map<String, Object?> json)
  => _$EvolvesToInfraFromJson(json);
}