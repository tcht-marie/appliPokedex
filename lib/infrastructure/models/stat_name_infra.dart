
import 'package:freezed_annotation/freezed_annotation.dart';

enum StatNameInfra {
  @JsonValue("HP")
  hp,
  @JsonValue("ATK")
  atk,
  @JsonValue("DEF")
  def,
  @JsonValue("SATK")
  satk,
  @JsonValue("SDEF")
  sdef,
  @JsonValue("SPD")
  spd,
  @JsonValue("ACC")
  acc,
  @JsonValue("EVA")
  eva;
}