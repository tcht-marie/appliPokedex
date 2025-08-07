import 'package:flutter/material.dart';
import 'package:poke/domain/models/pokemon_types.dart';
import '../../config/colors.dart';

class TypeChip extends StatelessWidget {
  final PokemonTypes type;

  const TypeChip({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 30,
      child: Chip(
        backgroundColor: PokedexColors.colorTypes(type),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        side: const BorderSide(width: 0),
        label: Container(
          alignment: Alignment.topCenter,
          child: Text(
            type.value,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ),
    );
  }
}
