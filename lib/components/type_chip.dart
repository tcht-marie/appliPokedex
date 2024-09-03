import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke/config/colors.dart';
import 'package:poke/domain/models/pokemon_types.dart';

class TypeChip extends StatelessWidget {
  final PokemonTypes type;

  const TypeChip({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Chip(
        backgroundColor: PokedexColors.colorTypes(type),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
        side: const BorderSide(width: 0),
        label: Text(style: Theme.of(context).textTheme.titleSmall, type.value),
      );
  }
}
