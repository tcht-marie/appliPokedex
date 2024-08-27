import 'package:freezed_annotation/freezed_annotation.dart';

import 'evolves_to_infra.dart';

part 'evolution_chain_infra.freezed.dart';
part 'evolution_chain_infra.g.dart';

@freezed
class EvolutionChainInfra with _$EvolutionChainInfra {

  const factory EvolutionChainInfra({
    required EvolvesToInfra evolvesTo
  }) = _EvolutionChainInfra;

  factory EvolutionChainInfra.fromJson(Map<String, Object?> json)
  => _$EvolutionChainInfraFromJson(json);
}
