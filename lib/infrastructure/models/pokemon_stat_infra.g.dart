// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_stat_infra.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonStatInfraImpl _$$PokemonStatInfraImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonStatInfraImpl(
      baseStat: (json['baseStat'] as num).toInt(),
      statName: $enumDecode(_$StatNameInfraEnumMap, json['statName']),
    );

Map<String, dynamic> _$$PokemonStatInfraImplToJson(
        _$PokemonStatInfraImpl instance) =>
    <String, dynamic>{
      'baseStat': instance.baseStat,
      'statName': _$StatNameInfraEnumMap[instance.statName]!,
    };

const _$StatNameInfraEnumMap = {
  StatNameInfra.hp: 'HP',
  StatNameInfra.atk: 'ATK',
  StatNameInfra.def: 'DEF',
  StatNameInfra.satk: 'SATK',
  StatNameInfra.sdef: 'SDEF',
  StatNameInfra.spd: 'SPD',
  StatNameInfra.acc: 'ACC',
  StatNameInfra.eva: 'EVA',
};
