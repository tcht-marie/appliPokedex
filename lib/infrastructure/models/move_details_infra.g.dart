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
