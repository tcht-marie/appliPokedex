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
  StatNameInfra.hp: 'hp',
  StatNameInfra.atk: 'atk',
  StatNameInfra.def: 'def',
  StatNameInfra.satk: 'satk',
  StatNameInfra.sdef: 'sdef',
  StatNameInfra.spd: 'spd',
  StatNameInfra.acc: 'acc',
  StatNameInfra.eva: 'eva',
};
