// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'version_infra.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VersionInfra _$VersionInfraFromJson(Map<String, dynamic> json) {
  return _VersionInfra.fromJson(json);
}

/// @nodoc
mixin _$VersionInfra {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this VersionInfra to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VersionInfra
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VersionInfraCopyWith<VersionInfra> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VersionInfraCopyWith<$Res> {
  factory $VersionInfraCopyWith(
          VersionInfra value, $Res Function(VersionInfra) then) =
      _$VersionInfraCopyWithImpl<$Res, VersionInfra>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$VersionInfraCopyWithImpl<$Res, $Val extends VersionInfra>
    implements $VersionInfraCopyWith<$Res> {
  _$VersionInfraCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VersionInfra
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VersionInfraImplCopyWith<$Res>
    implements $VersionInfraCopyWith<$Res> {
  factory _$$VersionInfraImplCopyWith(
          _$VersionInfraImpl value, $Res Function(_$VersionInfraImpl) then) =
      __$$VersionInfraImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$VersionInfraImplCopyWithImpl<$Res>
    extends _$VersionInfraCopyWithImpl<$Res, _$VersionInfraImpl>
    implements _$$VersionInfraImplCopyWith<$Res> {
  __$$VersionInfraImplCopyWithImpl(
      _$VersionInfraImpl _value, $Res Function(_$VersionInfraImpl) _then)
      : super(_value, _then);

  /// Create a copy of VersionInfra
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$VersionInfraImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VersionInfraImpl implements _VersionInfra {
  const _$VersionInfraImpl({required this.name, required this.url});

  factory _$VersionInfraImpl.fromJson(Map<String, dynamic> json) =>
      _$$VersionInfraImplFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'VersionInfra(name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VersionInfraImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  /// Create a copy of VersionInfra
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VersionInfraImplCopyWith<_$VersionInfraImpl> get copyWith =>
      __$$VersionInfraImplCopyWithImpl<_$VersionInfraImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VersionInfraImplToJson(
      this,
    );
  }
}

abstract class _VersionInfra implements VersionInfra {
  const factory _VersionInfra(
      {required final String name,
      required final String url}) = _$VersionInfraImpl;

  factory _VersionInfra.fromJson(Map<String, dynamic> json) =
      _$VersionInfraImpl.fromJson;

  @override
  String get name;
  @override
  String get url;

  /// Create a copy of VersionInfra
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VersionInfraImplCopyWith<_$VersionInfraImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
