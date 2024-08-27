// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_infra.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonInfraImpl _$$PokemonInfraImplFromJson(Map<String, dynamic> json) =>
    _$PokemonInfraImpl(
      id: (json['id'] as num).toInt(),
      idLabel: json['idLabel'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$$PokemonInfraImplToJson(_$PokemonInfraImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idLabel': instance.idLabel,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
    };
