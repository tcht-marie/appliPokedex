// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_details_infra.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemDetailsInfraImpl _$$ItemDetailsInfraImplFromJson(
        Map<String, dynamic> json) =>
    _$ItemDetailsInfraImpl(
      spriteUrl: json['spriteUrl'] as String,
      name: json['name'] as String,
      id: (json['id'] as num).toInt(),
      effect: json['effect'] as String,
      category: json['category'] as String,
    );

Map<String, dynamic> _$$ItemDetailsInfraImplToJson(
        _$ItemDetailsInfraImpl instance) =>
    <String, dynamic>{
      'spriteUrl': instance.spriteUrl,
      'name': instance.name,
      'id': instance.id,
      'effect': instance.effect,
      'category': instance.category,
    };
