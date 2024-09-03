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
      weight: json['weight'] as String,
      cries: json['cries'] as String,
      height: json['height'] as String,
      imageUrl: json['imageUrl'] as String,
      flavorText: json['flavorText'] as String,
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
      'imageUrl': instance.imageUrl,
      'flavorText': instance.flavorText,
      'pokemonTypes': instance.pokemonTypes
          .map((e) => _$PokemonTypesInfraEnumMap[e]!)
          .toList(),
      'pokemonStat': instance.pokemonStat,
      'abilities': instance.abilities,
      'evolutionChain': instance.evolutionChain,
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
