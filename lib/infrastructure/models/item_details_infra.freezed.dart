// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_details_infra.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemDetailsInfra _$ItemDetailsInfraFromJson(Map<String, dynamic> json) {
  return _ItemDetailsInfra.fromJson(json);
}

/// @nodoc
mixin _$ItemDetailsInfra {
  String get spriteUrl => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get effect => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;

  /// Serializes this ItemDetailsInfra to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ItemDetailsInfra
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemDetailsInfraCopyWith<ItemDetailsInfra> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemDetailsInfraCopyWith<$Res> {
  factory $ItemDetailsInfraCopyWith(
          ItemDetailsInfra value, $Res Function(ItemDetailsInfra) then) =
      _$ItemDetailsInfraCopyWithImpl<$Res, ItemDetailsInfra>;
  @useResult
  $Res call(
      {String spriteUrl, String name, int id, String effect, String category});
}

/// @nodoc
class _$ItemDetailsInfraCopyWithImpl<$Res, $Val extends ItemDetailsInfra>
    implements $ItemDetailsInfraCopyWith<$Res> {
  _$ItemDetailsInfraCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItemDetailsInfra
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spriteUrl = null,
    Object? name = null,
    Object? id = null,
    Object? effect = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      spriteUrl: null == spriteUrl
          ? _value.spriteUrl
          : spriteUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      effect: null == effect
          ? _value.effect
          : effect // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemDetailsInfraImplCopyWith<$Res>
    implements $ItemDetailsInfraCopyWith<$Res> {
  factory _$$ItemDetailsInfraImplCopyWith(_$ItemDetailsInfraImpl value,
          $Res Function(_$ItemDetailsInfraImpl) then) =
      __$$ItemDetailsInfraImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String spriteUrl, String name, int id, String effect, String category});
}

/// @nodoc
class __$$ItemDetailsInfraImplCopyWithImpl<$Res>
    extends _$ItemDetailsInfraCopyWithImpl<$Res, _$ItemDetailsInfraImpl>
    implements _$$ItemDetailsInfraImplCopyWith<$Res> {
  __$$ItemDetailsInfraImplCopyWithImpl(_$ItemDetailsInfraImpl _value,
      $Res Function(_$ItemDetailsInfraImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItemDetailsInfra
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spriteUrl = null,
    Object? name = null,
    Object? id = null,
    Object? effect = null,
    Object? category = null,
  }) {
    return _then(_$ItemDetailsInfraImpl(
      spriteUrl: null == spriteUrl
          ? _value.spriteUrl
          : spriteUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      effect: null == effect
          ? _value.effect
          : effect // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemDetailsInfraImpl implements _ItemDetailsInfra {
  const _$ItemDetailsInfraImpl(
      {required this.spriteUrl,
      required this.name,
      required this.id,
      required this.effect,
      required this.category});

  factory _$ItemDetailsInfraImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemDetailsInfraImplFromJson(json);

  @override
  final String spriteUrl;
  @override
  final String name;
  @override
  final int id;
  @override
  final String effect;
  @override
  final String category;

  @override
  String toString() {
    return 'ItemDetailsInfra(spriteUrl: $spriteUrl, name: $name, id: $id, effect: $effect, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemDetailsInfraImpl &&
            (identical(other.spriteUrl, spriteUrl) ||
                other.spriteUrl == spriteUrl) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.effect, effect) || other.effect == effect) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, spriteUrl, name, id, effect, category);

  /// Create a copy of ItemDetailsInfra
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemDetailsInfraImplCopyWith<_$ItemDetailsInfraImpl> get copyWith =>
      __$$ItemDetailsInfraImplCopyWithImpl<_$ItemDetailsInfraImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemDetailsInfraImplToJson(
      this,
    );
  }
}

abstract class _ItemDetailsInfra implements ItemDetailsInfra {
  const factory _ItemDetailsInfra(
      {required final String spriteUrl,
      required final String name,
      required final int id,
      required final String effect,
      required final String category}) = _$ItemDetailsInfraImpl;

  factory _ItemDetailsInfra.fromJson(Map<String, dynamic> json) =
      _$ItemDetailsInfraImpl.fromJson;

  @override
  String get spriteUrl;
  @override
  String get name;
  @override
  int get id;
  @override
  String get effect;
  @override
  String get category;

  /// Create a copy of ItemDetailsInfra
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemDetailsInfraImplCopyWith<_$ItemDetailsInfraImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
