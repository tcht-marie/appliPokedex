// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_infra.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokemonInfra _$PokemonInfraFromJson(Map<String, dynamic> json) {
  return _PokemonInfra.fromJson(json);
}

/// @nodoc
mixin _$PokemonInfra {
  int get id => throw _privateConstructorUsedError;
  String get idLabel => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this PokemonInfra to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonInfra
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonInfraCopyWith<PokemonInfra> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonInfraCopyWith<$Res> {
  factory $PokemonInfraCopyWith(
          PokemonInfra value, $Res Function(PokemonInfra) then) =
      _$PokemonInfraCopyWithImpl<$Res, PokemonInfra>;
  @useResult
  $Res call({int id, String idLabel, String name, String imageUrl});
}

/// @nodoc
class _$PokemonInfraCopyWithImpl<$Res, $Val extends PokemonInfra>
    implements $PokemonInfraCopyWith<$Res> {
  _$PokemonInfraCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonInfra
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idLabel = null,
    Object? name = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      idLabel: null == idLabel
          ? _value.idLabel
          : idLabel // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonInfraImplCopyWith<$Res>
    implements $PokemonInfraCopyWith<$Res> {
  factory _$$PokemonInfraImplCopyWith(
          _$PokemonInfraImpl value, $Res Function(_$PokemonInfraImpl) then) =
      __$$PokemonInfraImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String idLabel, String name, String imageUrl});
}

/// @nodoc
class __$$PokemonInfraImplCopyWithImpl<$Res>
    extends _$PokemonInfraCopyWithImpl<$Res, _$PokemonInfraImpl>
    implements _$$PokemonInfraImplCopyWith<$Res> {
  __$$PokemonInfraImplCopyWithImpl(
      _$PokemonInfraImpl _value, $Res Function(_$PokemonInfraImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonInfra
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idLabel = null,
    Object? name = null,
    Object? imageUrl = null,
  }) {
    return _then(_$PokemonInfraImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      idLabel: null == idLabel
          ? _value.idLabel
          : idLabel // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonInfraImpl implements _PokemonInfra {
  const _$PokemonInfraImpl(
      {required this.id,
      required this.idLabel,
      required this.name,
      required this.imageUrl});

  factory _$PokemonInfraImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonInfraImplFromJson(json);

  @override
  final int id;
  @override
  final String idLabel;
  @override
  final String name;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'PokemonInfra(id: $id, idLabel: $idLabel, name: $name, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonInfraImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idLabel, idLabel) || other.idLabel == idLabel) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, idLabel, name, imageUrl);

  /// Create a copy of PokemonInfra
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonInfraImplCopyWith<_$PokemonInfraImpl> get copyWith =>
      __$$PokemonInfraImplCopyWithImpl<_$PokemonInfraImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonInfraImplToJson(
      this,
    );
  }
}

abstract class _PokemonInfra implements PokemonInfra {
  const factory _PokemonInfra(
      {required final int id,
      required final String idLabel,
      required final String name,
      required final String imageUrl}) = _$PokemonInfraImpl;

  factory _PokemonInfra.fromJson(Map<String, dynamic> json) =
      _$PokemonInfraImpl.fromJson;

  @override
  int get id;
  @override
  String get idLabel;
  @override
  String get name;
  @override
  String get imageUrl;

  /// Create a copy of PokemonInfra
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonInfraImplCopyWith<_$PokemonInfraImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
