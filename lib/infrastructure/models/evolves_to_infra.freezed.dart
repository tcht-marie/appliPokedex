// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'evolves_to_infra.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EvolvesToInfra _$EvolvesToInfraFromJson(Map<String, dynamic> json) {
  return _EvolvesToInfra.fromJson(json);
}

/// @nodoc
mixin _$EvolvesToInfra {
  List<EvolvesToInfra> get evolvesTo => throw _privateConstructorUsedError;
  PokemonInfra get pokemon => throw _privateConstructorUsedError;

  /// Serializes this EvolvesToInfra to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EvolvesToInfra
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EvolvesToInfraCopyWith<EvolvesToInfra> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EvolvesToInfraCopyWith<$Res> {
  factory $EvolvesToInfraCopyWith(
          EvolvesToInfra value, $Res Function(EvolvesToInfra) then) =
      _$EvolvesToInfraCopyWithImpl<$Res, EvolvesToInfra>;
  @useResult
  $Res call({List<EvolvesToInfra> evolvesTo, PokemonInfra pokemon});

  $PokemonInfraCopyWith<$Res> get pokemon;
}

/// @nodoc
class _$EvolvesToInfraCopyWithImpl<$Res, $Val extends EvolvesToInfra>
    implements $EvolvesToInfraCopyWith<$Res> {
  _$EvolvesToInfraCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EvolvesToInfra
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? evolvesTo = null,
    Object? pokemon = null,
  }) {
    return _then(_value.copyWith(
      evolvesTo: null == evolvesTo
          ? _value.evolvesTo
          : evolvesTo // ignore: cast_nullable_to_non_nullable
              as List<EvolvesToInfra>,
      pokemon: null == pokemon
          ? _value.pokemon
          : pokemon // ignore: cast_nullable_to_non_nullable
              as PokemonInfra,
    ) as $Val);
  }

  /// Create a copy of EvolvesToInfra
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokemonInfraCopyWith<$Res> get pokemon {
    return $PokemonInfraCopyWith<$Res>(_value.pokemon, (value) {
      return _then(_value.copyWith(pokemon: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EvolvesToInfraImplCopyWith<$Res>
    implements $EvolvesToInfraCopyWith<$Res> {
  factory _$$EvolvesToInfraImplCopyWith(_$EvolvesToInfraImpl value,
          $Res Function(_$EvolvesToInfraImpl) then) =
      __$$EvolvesToInfraImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<EvolvesToInfra> evolvesTo, PokemonInfra pokemon});

  @override
  $PokemonInfraCopyWith<$Res> get pokemon;
}

/// @nodoc
class __$$EvolvesToInfraImplCopyWithImpl<$Res>
    extends _$EvolvesToInfraCopyWithImpl<$Res, _$EvolvesToInfraImpl>
    implements _$$EvolvesToInfraImplCopyWith<$Res> {
  __$$EvolvesToInfraImplCopyWithImpl(
      _$EvolvesToInfraImpl _value, $Res Function(_$EvolvesToInfraImpl) _then)
      : super(_value, _then);

  /// Create a copy of EvolvesToInfra
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? evolvesTo = null,
    Object? pokemon = null,
  }) {
    return _then(_$EvolvesToInfraImpl(
      evolvesTo: null == evolvesTo
          ? _value._evolvesTo
          : evolvesTo // ignore: cast_nullable_to_non_nullable
              as List<EvolvesToInfra>,
      pokemon: null == pokemon
          ? _value.pokemon
          : pokemon // ignore: cast_nullable_to_non_nullable
              as PokemonInfra,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EvolvesToInfraImpl implements _EvolvesToInfra {
  const _$EvolvesToInfraImpl(
      {required final List<EvolvesToInfra> evolvesTo, required this.pokemon})
      : _evolvesTo = evolvesTo;

  factory _$EvolvesToInfraImpl.fromJson(Map<String, dynamic> json) =>
      _$$EvolvesToInfraImplFromJson(json);

  final List<EvolvesToInfra> _evolvesTo;
  @override
  List<EvolvesToInfra> get evolvesTo {
    if (_evolvesTo is EqualUnmodifiableListView) return _evolvesTo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_evolvesTo);
  }

  @override
  final PokemonInfra pokemon;

  @override
  String toString() {
    return 'EvolvesToInfra(evolvesTo: $evolvesTo, pokemon: $pokemon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EvolvesToInfraImpl &&
            const DeepCollectionEquality()
                .equals(other._evolvesTo, _evolvesTo) &&
            (identical(other.pokemon, pokemon) || other.pokemon == pokemon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_evolvesTo), pokemon);

  /// Create a copy of EvolvesToInfra
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EvolvesToInfraImplCopyWith<_$EvolvesToInfraImpl> get copyWith =>
      __$$EvolvesToInfraImplCopyWithImpl<_$EvolvesToInfraImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EvolvesToInfraImplToJson(
      this,
    );
  }
}

abstract class _EvolvesToInfra implements EvolvesToInfra {
  const factory _EvolvesToInfra(
      {required final List<EvolvesToInfra> evolvesTo,
      required final PokemonInfra pokemon}) = _$EvolvesToInfraImpl;

  factory _EvolvesToInfra.fromJson(Map<String, dynamic> json) =
      _$EvolvesToInfraImpl.fromJson;

  @override
  List<EvolvesToInfra> get evolvesTo;
  @override
  PokemonInfra get pokemon;

  /// Create a copy of EvolvesToInfra
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EvolvesToInfraImplCopyWith<_$EvolvesToInfraImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
