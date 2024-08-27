
import 'package:freezed_annotation/freezed_annotation.dart';
part 'version_infra.freezed.dart';
part 'version_infra.g.dart';

@freezed
class VersionInfra with _$VersionInfra {
  const factory VersionInfra({
    required String name,
    required String url
  }) = _VersionInfra;

  factory VersionInfra.fromJson(Map<String, Object?> json)
  => _$VersionInfraFromJson(json);
}