// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'move_details_infra.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MoveDetailsInfra _$MoveDetailsInfraFromJson(Map<String, dynamic> json) {
  return _MoveDetailsInfra.fromJson(json);
}

/// @nodoc
mixin _$MoveDetailsInfra {
  String get name => throw _privateConstructorUsedError;
  int get power => throw _privateConstructorUsedError;
  int get pp => throw _privateConstructorUsedError;
  PokemonTypesInfra get pokemonTypes => throw _privateConstructorUsedError;
  String get flavorText => throw _privateConstructorUsedError;
  List<PokemonInfra> get pokemons => throw _privateConstructorUsedError;

  /// Serializes this MoveDetailsInfra to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MoveDetailsInfra
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MoveDetailsInfraCopyWith<MoveDetailsInfra> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoveDetailsInfraCopyWith<$Res> {
  factory $MoveDetailsInfraCopyWith(
          MoveDetailsInfra value, $Res Function(MoveDetailsInfra) then) =
      _$MoveDetailsInfraCopyWithImpl<$Res, MoveDetailsInfra>;
  @useResult
  $Res call(
      {String name,
      int power,
      int pp,
      PokemonTypesInfra pokemonTypes,
      String flavorText,
      List<PokemonInfra> pokemons});
}

/// @nodoc
class _$MoveDetailsInfraCopyWithImpl<$Res, $Val extends MoveDetailsInfra>
    implements $MoveDetailsInfraCopyWith<$Res> {
  _$MoveDetailsInfraCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MoveDetailsInfra
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? power = null,
    Object? pp = null,
    Object? pokemonTypes = null,
    Object? flavorText = null,
    Object? pokemons = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      power: null == power
          ? _value.power
          : power // ignore: cast_nullable_to_non_nullable
              as int,
      pp: null == pp
          ? _value.pp
          : pp // ignore: cast_nullable_to_non_nullable
              as int,
      pokemonTypes: null == pokemonTypes
          ? _value.pokemonTypes
          : pokemonTypes // ignore: cast_nullable_to_non_nullable
              as PokemonTypesInfra,
      flavorText: null == flavorText
          ? _value.flavorText
          : flavorText // ignore: cast_nullable_to_non_nullable
              as String,
      pokemons: null == pokemons
          ? _value.pokemons
          : pokemons // ignore: cast_nullable_to_non_nullable
              as List<PokemonInfra>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MoveDetailsInfraImplCopyWith<$Res>
    implements $MoveDetailsInfraCopyWith<$Res> {
  factory _$$MoveDetailsInfraImplCopyWith(_$MoveDetailsInfraImpl value,
          $Res Function(_$MoveDetailsInfraImpl) then) =
      __$$MoveDetailsInfraImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      int power,
      int pp,
      PokemonTypesInfra pokemonTypes,
      String flavorText,
      List<PokemonInfra> pokemons});
}

/// @nodoc
class __$$MoveDetailsInfraImplCopyWithImpl<$Res>
    extends _$MoveDetailsInfraCopyWithImpl<$Res, _$MoveDetailsInfraImpl>
    implements _$$MoveDetailsInfraImplCopyWith<$Res> {
  __$$MoveDetailsInfraImplCopyWithImpl(_$MoveDetailsInfraImpl _value,
      $Res Function(_$MoveDetailsInfraImpl) _then)
      : super(_value, _then);

  /// Create a copy of MoveDetailsInfra
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? power = null,
    Object? pp = null,
    Object? pokemonTypes = null,
    Object? flavorText = null,
    Object? pokemons = null,
  }) {
    return _then(_$MoveDetailsInfraImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      power: null == power
          ? _value.power
          : power // ignore: cast_nullable_to_non_nullable
              as int,
      pp: null == pp
          ? _value.pp
          : pp // ignore: cast_nullable_to_non_nullable
              as int,
      pokemonTypes: null == pokemonTypes
          ? _value.pokemonTypes
          : pokemonTypes // ignore: cast_nullable_to_non_nullable
              as PokemonTypesInfra,
      flavorText: null == flavorText
          ? _value.flavorText
          : flavorText // ignore: cast_nullable_to_non_nullable
              as String,
      pokemons: null == pokemons
          ? _value._pokemons
          : pokemons // ignore: cast_nullable_to_non_nullable
              as List<PokemonInfra>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MoveDetailsInfraImpl implements _MoveDetailsInfra {
  const _$MoveDetailsInfraImpl(
      {required this.name,
      required this.power,
      required this.pp,
      required this.pokemonTypes,
      required this.flavorText,
      required final List<PokemonInfra> pokemons})
      : _pokemons = pokemons;

  factory _$MoveDetailsInfraImpl.fromJson(Map<String, dynamic> json) =>
      _$$MoveDetailsInfraImplFromJson(json);

  @override
  final String name;
  @override
  final int power;
  @override
  final int pp;
  @override
  final PokemonTypesInfra pokemonTypes;
  @override
  final String flavorText;
  final List<PokemonInfra> _pokemons;
  @override
  List<PokemonInfra> get pokemons {
    if (_pokemons is EqualUnmodifiableListView) return _pokemons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pokemons);
  }

  @override
  String toString() {
    return 'MoveDetailsInfra(name: $name, power: $power, pp: $pp, pokemonTypes: $pokemonTypes, flavorText: $flavorText, pokemons: $pokemons)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoveDetailsInfraImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.power, power) || other.power == power) &&
            (identical(other.pp, pp) || other.pp == pp) &&
            (identical(other.pokemonTypes, pokemonTypes) ||
                other.pokemonTypes == pokemonTypes) &&
            (identical(other.flavorText, flavorText) ||
                other.flavorText == flavorText) &&
            const DeepCollectionEquality().equals(other._pokemons, _pokemons));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, power, pp, pokemonTypes,
      flavorText, const DeepCollectionEquality().hash(_pokemons));

  /// Create a copy of MoveDetailsInfra
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MoveDetailsInfraImplCopyWith<_$MoveDetailsInfraImpl> get copyWith =>
      __$$MoveDetailsInfraImplCopyWithImpl<_$MoveDetailsInfraImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MoveDetailsInfraImplToJson(
      this,
    );
  }
}

abstract class _MoveDetailsInfra implements MoveDetailsInfra {
  const factory _MoveDetailsInfra(
      {required final String name,
      required final int power,
      required final int pp,
      required final PokemonTypesInfra pokemonTypes,
      required final String flavorText,
      required final List<PokemonInfra> pokemons}) = _$MoveDetailsInfraImpl;

  factory _MoveDetailsInfra.fromJson(Map<String, dynamic> json) =
      _$MoveDetailsInfraImpl.fromJson;

  @override
  String get name;
  @override
  int get power;
  @override
  int get pp;
  @override
  PokemonTypesInfra get pokemonTypes;
  @override
  String get flavorText;
  @override
  List<PokemonInfra> get pokemons;

  /// Create a copy of MoveDetailsInfra
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MoveDetailsInfraImplCopyWith<_$MoveDetailsInfraImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
