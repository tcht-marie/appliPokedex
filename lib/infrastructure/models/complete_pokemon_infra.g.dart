// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_pokemon_infra.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompletePokemonInfraImpl _$$CompletePokemonInfraImplFromJson(
        Map<String, dynamic> json) =>
    _$CompletePokemonInfraImpl(
      id: (json['id'] as num).toInt(),
      idLabel: json['idLabel'] as String,
      name: json['name'] as String,
      weight: (json['weight'] as num).toInt(),
      cries: json['cries'] as String,
      height: (json['height'] as num).toInt(),
      pokemonTypes: (json['pokemonTypes'] as List<dynamic>)
          .map((e) => $enumDecode(_$PokemonTypesInfraEnumMap, e))
          .toList(),
      pokemonStat: (json['pokemonStat'] as List<dynamic>)
          .map((e) => PokemonStatInfra.fromJson(e as Map<String, dynamic>))
          .toList(),
      abilities:
          (json['abilities'] as List<dynamic>).map((e) => e as String).toList(),
      evolutionChain: EvolutionChainInfra.fromJson(
          json['evolutionChain'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CompletePokemonInfraImplToJson(
        _$CompletePokemonInfraImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idLabel': instance.idLabel,
      'name': instance.name,
      'weight': instance.weight,
      'cries': instance.cries,
      'height': instance.height,
      'pokemonTypes': instance.pokemonTypes
          .map((e) => _$PokemonTypesInfraEnumMap[e]!)
          .toList(),
      'pokemonStat': instance.pokemonStat,
      'abilities': instance.abilities,
      'evolutionChain': instance.evolutionChain,
    };

const _$PokemonTypesInfraEnumMap = {
  PokemonTypesInfra.normal: 'normal',
  PokemonTypesInfra.fighting: 'fighting',
  PokemonTypesInfra.flying: 'flying',
  PokemonTypesInfra.poison: 'poison',
  PokemonTypesInfra.ground: 'ground',
  PokemonTypesInfra.rock: 'rock',
  PokemonTypesInfra.bug: 'bug',
  PokemonTypesInfra.ghost: 'ghost',
  PokemonTypesInfra.steel: 'steel',
  PokemonTypesInfra.fire: 'fire',
  PokemonTypesInfra.water: 'water',
  PokemonTypesInfra.grass: 'grass',
  PokemonTypesInfra.electric: 'electric',
  PokemonTypesInfra.psychic: 'psychic',
  PokemonTypesInfra.ice: 'ice',
  PokemonTypesInfra.dragon: 'dragon',
  PokemonTypesInfra.dark: 'dark',
  PokemonTypesInfra.fairy: 'fairy',
  PokemonTypesInfra.stellar: 'stellar',
  PokemonTypesInfra.shadow: 'shadow',
};
