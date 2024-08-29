
import 'package:freezed_annotation/freezed_annotation.dart';

enum PokemonTypesInfra {
  @JsonValue("NORMAL")
  normal,
  @JsonValue("FIGHTING")
  fighting,
  @JsonValue("FLYING")
  flying,
  @JsonValue("POISON")
  poison,
  @JsonValue("GROUND")
  ground,
  @JsonValue("ROCK")
  rock,
  @JsonValue("BUG")
  bug,
  @JsonValue("GHOST")
  ghost,
  @JsonValue("STEEL")
  steel,
  @JsonValue("FIRE")
  fire,
  @JsonValue("WATER")
  water,
  @JsonValue("GRASS")
  grass,
  @JsonValue("ELECTRIC")
  electric,
  @JsonValue("PSYCHIC")
  psychic,
  @JsonValue("ICE")
  ice,
  @JsonValue("DRAGON")
  dragon,
  @JsonValue("DARK")
  dark,
  @JsonValue("FAIRY")
  fairy,
  @JsonValue("STELLAR")
  stellar,
  @JsonValue("SHADOW")
  shadow;
}