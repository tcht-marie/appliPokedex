// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'complete_pokemon_infra.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CompletePokemonInfra _$CompletePokemonInfraFromJson(Map<String, dynamic> json) {
  return _CompletePokemonInfra.fromJson(json);
}

/// @nodoc
mixin _$CompletePokemonInfra {
  int get id => throw _privateConstructorUsedError;
  String get idLabel => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get weight => throw _privateConstructorUsedError;
  String get cries => throw _privateConstructorUsedError;
  String get height => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get flavorText => throw _privateConstructorUsedError;
  List<PokemonTypesInfra> get pokemonTypes =>
      throw _privateConstructorUsedError;
  List<PokemonStatInfra> get pokemonStat => throw _privateConstructorUsedError;
  List<String> get abilities => throw _privateConstructorUsedError;
  EvolutionChainInfra get evolutionChain => throw _privateConstructorUsedError;

  /// Serializes this CompletePokemonInfra to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CompletePokemonInfra
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompletePokemonInfraCopyWith<CompletePokemonInfra> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompletePokemonInfraCopyWith<$Res> {
  factory $CompletePokemonInfraCopyWith(CompletePokemonInfra value,
          $Res Function(CompletePokemonInfra) then) =
      _$CompletePokemonInfraCopyWithImpl<$Res, CompletePokemonInfra>;
  @useResult
  $Res call(
      {int id,
      String idLabel,
      String name,
      String weight,
      String cries,
      String height,
      String imageUrl,
      String flavorText,
      List<PokemonTypesInfra> pokemonTypes,
      List<PokemonStatInfra> pokemonStat,
      List<String> abilities,
      EvolutionChainInfra evolutionChain});

  $EvolutionChainInfraCopyWith<$Res> get evolutionChain;
}

/// @nodoc
class _$CompletePokemonInfraCopyWithImpl<$Res,
        $Val extends CompletePokemonInfra>
    implements $CompletePokemonInfraCopyWith<$Res> {
  _$CompletePokemonInfraCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CompletePokemonInfra
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idLabel = null,
    Object? name = null,
    Object? weight = null,
    Object? cries = null,
    Object? height = null,
    Object? imageUrl = null,
    Object? flavorText = null,
    Object? pokemonTypes = null,
    Object? pokemonStat = null,
    Object? abilities = null,
    Object? evolutionChain = null,
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
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String,
      cries: null == cries
          ? _value.cries
          : cries // ignore: cast_nullable_to_non_nullable
              as String,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      flavorText: null == flavorText
          ? _value.flavorText
          : flavorText // ignore: cast_nullable_to_non_nullable
              as String,
      pokemonTypes: null == pokemonTypes
          ? _value.pokemonTypes
          : pokemonTypes // ignore: cast_nullable_to_non_nullable
              as List<PokemonTypesInfra>,
      pokemonStat: null == pokemonStat
          ? _value.pokemonStat
          : pokemonStat // ignore: cast_nullable_to_non_nullable
              as List<PokemonStatInfra>,
      abilities: null == abilities
          ? _value.abilities
          : abilities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      evolutionChain: null == evolutionChain
          ? _value.evolutionChain
          : evolutionChain // ignore: cast_nullable_to_non_nullable
              as EvolutionChainInfra,
    ) as $Val);
  }

  /// Create a copy of CompletePokemonInfra
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EvolutionChainInfraCopyWith<$Res> get evolutionChain {
    return $EvolutionChainInfraCopyWith<$Res>(_value.evolutionChain, (value) {
      return _then(_value.copyWith(evolutionChain: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CompletePokemonInfraImplCopyWith<$Res>
    implements $CompletePokemonInfraCopyWith<$Res> {
  factory _$$CompletePokemonInfraImplCopyWith(_$CompletePokemonInfraImpl value,
          $Res Function(_$CompletePokemonInfraImpl) then) =
      __$$CompletePokemonInfraImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String idLabel,
      String name,
      String weight,
      String cries,
      String height,
      String imageUrl,
      String flavorText,
      List<PokemonTypesInfra> pokemonTypes,
      List<PokemonStatInfra> pokemonStat,
      List<String> abilities,
      EvolutionChainInfra evolutionChain});

  @override
  $EvolutionChainInfraCopyWith<$Res> get evolutionChain;
}

/// @nodoc
class __$$CompletePokemonInfraImplCopyWithImpl<$Res>
    extends _$CompletePokemonInfraCopyWithImpl<$Res, _$CompletePokemonInfraImpl>
    implements _$$CompletePokemonInfraImplCopyWith<$Res> {
  __$$CompletePokemonInfraImplCopyWithImpl(_$CompletePokemonInfraImpl _value,
      $Res Function(_$CompletePokemonInfraImpl) _then)
      : super(_value, _then);

  /// Create a copy of CompletePokemonInfra
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idLabel = null,
    Object? name = null,
    Object? weight = null,
    Object? cries = null,
    Object? height = null,
    Object? imageUrl = null,
    Object? flavorText = null,
    Object? pokemonTypes = null,
    Object? pokemonStat = null,
    Object? abilities = null,
    Object? evolutionChain = null,
  }) {
    return _then(_$CompletePokemonInfraImpl(
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
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String,
      cries: null == cries
          ? _value.cries
          : cries // ignore: cast_nullable_to_non_nullable
              as String,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      flavorText: null == flavorText
          ? _value.flavorText
          : flavorText // ignore: cast_nullable_to_non_nullable
              as String,
      pokemonTypes: null == pokemonTypes
          ? _value._pokemonTypes
          : pokemonTypes // ignore: cast_nullable_to_non_nullable
              as List<PokemonTypesInfra>,
      pokemonStat: null == pokemonStat
          ? _value._pokemonStat
          : pokemonStat // ignore: cast_nullable_to_non_nullable
              as List<PokemonStatInfra>,
      abilities: null == abilities
          ? _value._abilities
          : abilities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      evolutionChain: null == evolutionChain
          ? _value.evolutionChain
          : evolutionChain // ignore: cast_nullable_to_non_nullable
              as EvolutionChainInfra,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompletePokemonInfraImpl implements _CompletePokemonInfra {
  const _$CompletePokemonInfraImpl(
      {required this.id,
      required this.idLabel,
      required this.name,
      required this.weight,
      required this.cries,
      required this.height,
      required this.imageUrl,
      required this.flavorText,
      required final List<PokemonTypesInfra> pokemonTypes,
      required final List<PokemonStatInfra> pokemonStat,
      required final List<String> abilities,
      required this.evolutionChain})
      : _pokemonTypes = pokemonTypes,
        _pokemonStat = pokemonStat,
        _abilities = abilities;

  factory _$CompletePokemonInfraImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompletePokemonInfraImplFromJson(json);

  @override
  final int id;
  @override
  final String idLabel;
  @override
  final String name;
  @override
  final String weight;
  @override
  final String cries;
  @override
  final String height;
  @override
  final String imageUrl;
  @override
  final String flavorText;
  final List<PokemonTypesInfra> _pokemonTypes;
  @override
  List<PokemonTypesInfra> get pokemonTypes {
    if (_pokemonTypes is EqualUnmodifiableListView) return _pokemonTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pokemonTypes);
  }

  final List<PokemonStatInfra> _pokemonStat;
  @override
  List<PokemonStatInfra> get pokemonStat {
    if (_pokemonStat is EqualUnmodifiableListView) return _pokemonStat;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pokemonStat);
  }

  final List<String> _abilities;
  @override
  List<String> get abilities {
    if (_abilities is EqualUnmodifiableListView) return _abilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_abilities);
  }

  @override
  final EvolutionChainInfra evolutionChain;

  @override
  String toString() {
    return 'CompletePokemonInfra(id: $id, idLabel: $idLabel, name: $name, weight: $weight, cries: $cries, height: $height, imageUrl: $imageUrl, flavorText: $flavorText, pokemonTypes: $pokemonTypes, pokemonStat: $pokemonStat, abilities: $abilities, evolutionChain: $evolutionChain)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompletePokemonInfraImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idLabel, idLabel) || other.idLabel == idLabel) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.cries, cries) || other.cries == cries) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.flavorText, flavorText) ||
                other.flavorText == flavorText) &&
            const DeepCollectionEquality()
                .equals(other._pokemonTypes, _pokemonTypes) &&
            const DeepCollectionEquality()
                .equals(other._pokemonStat, _pokemonStat) &&
            const DeepCollectionEquality()
                .equals(other._abilities, _abilities) &&
            (identical(other.evolutionChain, evolutionChain) ||
                other.evolutionChain == evolutionChain));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      idLabel,
      name,
      weight,
      cries,
      height,
      imageUrl,
      flavorText,
      const DeepCollectionEquality().hash(_pokemonTypes),
      const DeepCollectionEquality().hash(_pokemonStat),
      const DeepCollectionEquality().hash(_abilities),
      evolutionChain);

  /// Create a copy of CompletePokemonInfra
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompletePokemonInfraImplCopyWith<_$CompletePokemonInfraImpl>
      get copyWith =>
          __$$CompletePokemonInfraImplCopyWithImpl<_$CompletePokemonInfraImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompletePokemonInfraImplToJson(
      this,
    );
  }
}

abstract class _CompletePokemonInfra implements CompletePokemonInfra {
  const factory _CompletePokemonInfra(
          {required final int id,
          required final String idLabel,
          required final String name,
          required final String weight,
          required final String cries,
          required final String height,
          required final String imageUrl,
          required final String flavorText,
          required final List<PokemonTypesInfra> pokemonTypes,
          required final List<PokemonStatInfra> pokemonStat,
          required final List<String> abilities,
          required final EvolutionChainInfra evolutionChain}) =
      _$CompletePokemonInfraImpl;

  factory _CompletePokemonInfra.fromJson(Map<String, dynamic> json) =
      _$CompletePokemonInfraImpl.fromJson;

  @override
  int get id;
  @override
  String get idLabel;
  @override
  String get name;
  @override
  String get weight;
  @override
  String get cries;
  @override
  String get height;
  @override
  String get imageUrl;
  @override
  String get flavorText;
  @override
  List<PokemonTypesInfra> get pokemonTypes;
  @override
  List<PokemonStatInfra> get pokemonStat;
  @override
  List<String> get abilities;
  @override
  EvolutionChainInfra get evolutionChain;

  /// Create a copy of CompletePokemonInfra
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompletePokemonInfraImplCopyWith<_$CompletePokemonInfraImpl>
      get copyWith => throw _privateConstructorUsedError;
}
