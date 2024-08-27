
import 'package:freezed_annotation/freezed_annotation.dart';
part 'item_details_infra.freezed.dart';
part 'item_details_infra.g.dart';

@freezed
class ItemDetailsInfra with _$ItemDetailsInfra {
  const factory ItemDetailsInfra({
    required String spriteUrl,
    required String name,
    required int id,
    required String effect,
    required String category
  }) = _ItemDetailsInfra;

  factory ItemDetailsInfra.fromJson(Map<String, Object?> json)
  => _$ItemDetailsInfraFromJson(json);
}