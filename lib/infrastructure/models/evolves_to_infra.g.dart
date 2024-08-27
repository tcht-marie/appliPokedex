// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evolves_to_infra.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EvolvesToInfraImpl _$$EvolvesToInfraImplFromJson(Map<String, dynamic> json) =>
    _$EvolvesToInfraImpl(
      evolvesTo: (json['evolvesTo'] as List<dynamic>)
          .map((e) => EvolvesToInfra.fromJson(e as Map<String, dynamic>))
          .toList(),
      pokemon: PokemonInfra.fromJson(json['pokemon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EvolvesToInfraImplToJson(
        _$EvolvesToInfraImpl instance) =>
    <String, dynamic>{
      'evolvesTo': instance.evolvesTo,
      'pokemon': instance.pokemon,
    };
