import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:poke/domain/models/pokemon_types.dart';

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}

class PokedexColors {

  static Color colorTypes(PokemonTypes pokeTypes) {
    return switch (pokeTypes) {
      PokemonTypes.bug => bug,
      PokemonTypes.dark => dark,
      PokemonTypes.dragon => dragon,
      PokemonTypes.electric => electric,
      PokemonTypes.fairy => fairy,
      PokemonTypes.fighting => fighting,
      PokemonTypes.fire => fire,
      PokemonTypes.flying => flying,
      PokemonTypes.ghost => ghost,
      PokemonTypes.normal => normal,
      PokemonTypes.grass => grass,
      PokemonTypes.ground => ground,
      PokemonTypes.ice => ice,
      PokemonTypes.poison => poison,
      PokemonTypes.psychic => psychic,
      PokemonTypes.rock => rock,
      PokemonTypes.steel => steel,
      PokemonTypes.stellar => stellar,
      PokemonTypes.shadow => dark,
      PokemonTypes.water => water,
    };
  }

  static Color identity = hexToColor('#DC0A2D');
  static Color bug = hexToColor('#A7B723');
  static Color dark = hexToColor('#75574C');
  static Color dragon = hexToColor('#7037FF');
  static Color electric = hexToColor('#F9CF30');
  static Color fairy = hexToColor('#E69EAC');
  static Color fighting = hexToColor('#C12239');
  static Color fire = hexToColor('#F57D31');
  static Color flying = hexToColor('#A891EC');
  static Color ghost = hexToColor('#70559B');
  static Color normal = hexToColor('#AAA67F');
  static Color grass = hexToColor('#74CB48');
  static Color ground = hexToColor('#DEC16B');
  static Color ice = hexToColor('#9AD6DF');
  static Color poison = hexToColor('#A43E9E');
  static Color psychic = hexToColor('#FB5584');
  static Color rock = hexToColor('#B69E31');
  static Color steel = hexToColor('#B7B9D0');
  static Color stellar = hexToColor('#00e6e6');
  static Color water = hexToColor('#6493EB');

  static ColorSwatch grayScale = ColorSwatch(hexToColor('#E0E0E0').value, {
    000: hexToColor('#212121'),
    025: hexToColor('#666666'),
    050: hexToColor('#E0E0E0'),
    075: hexToColor('#EFEFEF'),
    100: hexToColor('#FFFFFF'),
  });
}
