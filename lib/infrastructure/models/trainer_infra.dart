
import 'package:freezed_annotation/freezed_annotation.dart';
part 'trainer_infra.freezed.dart';
part 'trainer_infra.g.dart';

@freezed
class TrainerInfra with _$TrainerInfra {
  const factory TrainerInfra({
    required String username,
    required String password
  }) = _TrainerInfra;

  factory TrainerInfra.fromJson(Map<String, Object?> json)
  => _$TrainerInfraFromJson(json);
}