// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_stat_infra.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokemonStatInfra _$PokemonStatInfraFromJson(Map<String, dynamic> json) {
  return _PokemonStatInfra.fromJson(json);
}

/// @nodoc
mixin _$PokemonStatInfra {
  int get baseStat => throw _privateConstructorUsedError;
  StatNameInfra get statName => throw _privateConstructorUsedError;

  /// Serializes this PokemonStatInfra to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonStatInfra
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonStatInfraCopyWith<PokemonStatInfra> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonStatInfraCopyWith<$Res> {
  factory $PokemonStatInfraCopyWith(
          PokemonStatInfra value, $Res Function(PokemonStatInfra) then) =
      _$PokemonStatInfraCopyWithImpl<$Res, PokemonStatInfra>;
  @useResult
  $Res call({int baseStat, StatNameInfra statName});
}

/// @nodoc
class _$PokemonStatInfraCopyWithImpl<$Res, $Val extends PokemonStatInfra>
    implements $PokemonStatInfraCopyWith<$Res> {
  _$PokemonStatInfraCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonStatInfra
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseStat = null,
    Object? statName = null,
  }) {
    return _then(_value.copyWith(
      baseStat: null == baseStat
          ? _value.baseStat
          : baseStat // ignore: cast_nullable_to_non_nullable
              as int,
      statName: null == statName
          ? _value.statName
          : statName // ignore: cast_nullable_to_non_nullable
              as StatNameInfra,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonStatInfraImplCopyWith<$Res>
    implements $PokemonStatInfraCopyWith<$Res> {
  factory _$$PokemonStatInfraImplCopyWith(_$PokemonStatInfraImpl value,
          $Res Function(_$PokemonStatInfraImpl) then) =
      __$$PokemonStatInfraImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int baseStat, StatNameInfra statName});
}

/// @nodoc
class __$$PokemonStatInfraImplCopyWithImpl<$Res>
    extends _$PokemonStatInfraCopyWithImpl<$Res, _$PokemonStatInfraImpl>
    implements _$$PokemonStatInfraImplCopyWith<$Res> {
  __$$PokemonStatInfraImplCopyWithImpl(_$PokemonStatInfraImpl _value,
      $Res Function(_$PokemonStatInfraImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonStatInfra
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseStat = null,
    Object? statName = null,
  }) {
    return _then(_$PokemonStatInfraImpl(
      baseStat: null == baseStat
          ? _value.baseStat
          : baseStat // ignore: cast_nullable_to_non_nullable
              as int,
      statName: null == statName
          ? _value.statName
          : statName // ignore: cast_nullable_to_non_nullable
              as StatNameInfra,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonStatInfraImpl implements _PokemonStatInfra {
  const _$PokemonStatInfraImpl(
      {required this.baseStat, required this.statName});

  factory _$PokemonStatInfraImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonStatInfraImplFromJson(json);

  @override
  final int baseStat;
  @override
  final StatNameInfra statName;

  @override
  String toString() {
    return 'PokemonStatInfra(baseStat: $baseStat, statName: $statName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonStatInfraImpl &&
            (identical(other.baseStat, baseStat) ||
                other.baseStat == baseStat) &&
            (identical(other.statName, statName) ||
                other.statName == statName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, baseStat, statName);

  /// Create a copy of PokemonStatInfra
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonStatInfraImplCopyWith<_$PokemonStatInfraImpl> get copyWith =>
      __$$PokemonStatInfraImplCopyWithImpl<_$PokemonStatInfraImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonStatInfraImplToJson(
      this,
    );
  }
}

abstract class _PokemonStatInfra implements PokemonStatInfra {
  const factory _PokemonStatInfra(
      {required final int baseStat,
      required final StatNameInfra statName}) = _$PokemonStatInfraImpl;

  factory _PokemonStatInfra.fromJson(Map<String, dynamic> json) =
      _$PokemonStatInfraImpl.fromJson;

  @override
  int get baseStat;
  @override
  StatNameInfra get statName;

  /// Create a copy of PokemonStatInfra
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonStatInfraImplCopyWith<_$PokemonStatInfraImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
