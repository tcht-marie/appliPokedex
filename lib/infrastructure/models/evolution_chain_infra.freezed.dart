// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'evolution_chain_infra.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EvolutionChainInfra _$EvolutionChainInfraFromJson(Map<String, dynamic> json) {
  return _EvolutionChainInfra.fromJson(json);
}

/// @nodoc
mixin _$EvolutionChainInfra {
  EvolvesToInfra get evolvesTo => throw _privateConstructorUsedError;

  /// Serializes this EvolutionChainInfra to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EvolutionChainInfra
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EvolutionChainInfraCopyWith<EvolutionChainInfra> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EvolutionChainInfraCopyWith<$Res> {
  factory $EvolutionChainInfraCopyWith(
          EvolutionChainInfra value, $Res Function(EvolutionChainInfra) then) =
      _$EvolutionChainInfraCopyWithImpl<$Res, EvolutionChainInfra>;
  @useResult
  $Res call({EvolvesToInfra evolvesTo});

  $EvolvesToInfraCopyWith<$Res> get evolvesTo;
}

/// @nodoc
class _$EvolutionChainInfraCopyWithImpl<$Res, $Val extends EvolutionChainInfra>
    implements $EvolutionChainInfraCopyWith<$Res> {
  _$EvolutionChainInfraCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EvolutionChainInfra
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? evolvesTo = null,
  }) {
    return _then(_value.copyWith(
      evolvesTo: null == evolvesTo
          ? _value.evolvesTo
          : evolvesTo // ignore: cast_nullable_to_non_nullable
              as EvolvesToInfra,
    ) as $Val);
  }

  /// Create a copy of EvolutionChainInfra
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EvolvesToInfraCopyWith<$Res> get evolvesTo {
    return $EvolvesToInfraCopyWith<$Res>(_value.evolvesTo, (value) {
      return _then(_value.copyWith(evolvesTo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EvolutionChainInfraImplCopyWith<$Res>
    implements $EvolutionChainInfraCopyWith<$Res> {
  factory _$$EvolutionChainInfraImplCopyWith(_$EvolutionChainInfraImpl value,
          $Res Function(_$EvolutionChainInfraImpl) then) =
      __$$EvolutionChainInfraImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({EvolvesToInfra evolvesTo});

  @override
  $EvolvesToInfraCopyWith<$Res> get evolvesTo;
}

/// @nodoc
class __$$EvolutionChainInfraImplCopyWithImpl<$Res>
    extends _$EvolutionChainInfraCopyWithImpl<$Res, _$EvolutionChainInfraImpl>
    implements _$$EvolutionChainInfraImplCopyWith<$Res> {
  __$$EvolutionChainInfraImplCopyWithImpl(_$EvolutionChainInfraImpl _value,
      $Res Function(_$EvolutionChainInfraImpl) _then)
      : super(_value, _then);

  /// Create a copy of EvolutionChainInfra
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? evolvesTo = null,
  }) {
    return _then(_$EvolutionChainInfraImpl(
      evolvesTo: null == evolvesTo
          ? _value.evolvesTo
          : evolvesTo // ignore: cast_nullable_to_non_nullable
              as EvolvesToInfra,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EvolutionChainInfraImpl implements _EvolutionChainInfra {
  const _$EvolutionChainInfraImpl({required this.evolvesTo});

  factory _$EvolutionChainInfraImpl.fromJson(Map<String, dynamic> json) =>
      _$$EvolutionChainInfraImplFromJson(json);

  @override
  final EvolvesToInfra evolvesTo;

  @override
  String toString() {
    return 'EvolutionChainInfra(evolvesTo: $evolvesTo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EvolutionChainInfraImpl &&
            (identical(other.evolvesTo, evolvesTo) ||
                other.evolvesTo == evolvesTo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, evolvesTo);

  /// Create a copy of EvolutionChainInfra
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EvolutionChainInfraImplCopyWith<_$EvolutionChainInfraImpl> get copyWith =>
      __$$EvolutionChainInfraImplCopyWithImpl<_$EvolutionChainInfraImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EvolutionChainInfraImplToJson(
      this,
    );
  }
}

abstract class _EvolutionChainInfra implements EvolutionChainInfra {
  const factory _EvolutionChainInfra(
      {required final EvolvesToInfra evolvesTo}) = _$EvolutionChainInfraImpl;

  factory _EvolutionChainInfra.fromJson(Map<String, dynamic> json) =
      _$EvolutionChainInfraImpl.fromJson;

  @override
  EvolvesToInfra get evolvesTo;

  /// Create a copy of EvolutionChainInfra
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EvolutionChainInfraImplCopyWith<_$EvolutionChainInfraImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
