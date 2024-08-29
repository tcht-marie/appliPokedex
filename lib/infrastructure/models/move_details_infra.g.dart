// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_details_infra.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MoveDetailsInfraImpl _$$MoveDetailsInfraImplFromJson(
        Map<String, dynamic> json) =>
    _$MoveDetailsInfraImpl(
      name: json['name'] as String,
      power: (json['power'] as num).toInt(),
      pp: (json['pp'] as num).toInt(),
      pokemonTypes:
          $enumDecode(_$PokemonTypesInfraEnumMap, json['pokemonTypes']),
      flavorText: json['flavorText'] as String,
      pokemons: (json['pokemons'] as List<dynamic>)
          .map((e) => PokemonInfra.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MoveDetailsInfraImplToJson(
        _$MoveDetailsInfraImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'power': instance.power,
      'pp': instance.pp,
      'pokemonTypes': _$PokemonTypesInfraEnumMap[instance.pokemonTypes]!,
      'flavorText': instance.flavorText,
      'pokemons': instance.pokemons,
    };

const _$PokemonTypesInfraEnumMap = {
  PokemonTypesInfra.normal: 'NORMAL',
  PokemonTypesInfra.fighting: 'FIGHTING',
  PokemonTypesInfra.flying: 'FLYING',
  PokemonTypesInfra.poison: 'POISON',
  PokemonTypesInfra.ground: 'GROUND',
  PokemonTypesInfra.rock: 'ROCK',
  PokemonTypesInfra.bug: 'BUG',
  PokemonTypesInfra.ghost: 'GHOST',
  PokemonTypesInfra.steel: 'STEEL',
  PokemonTypesInfra.fire: 'FIRE',
  PokemonTypesInfra.water: 'WATER',
  PokemonTypesInfra.grass: 'GRASS',
  PokemonTypesInfra.electric: 'ELECTRIC',
  PokemonTypesInfra.psychic: 'PSYCHIC',
  PokemonTypesInfra.ice: 'ICE',
  PokemonTypesInfra.dragon: 'DRAGON',
  PokemonTypesInfra.dark: 'DARK',
  PokemonTypesInfra.fairy: 'FAIRY',
  PokemonTypesInfra.stellar: 'STELLAR',
  PokemonTypesInfra.shadow: 'SHADOW',
};
