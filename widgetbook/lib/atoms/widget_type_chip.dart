import 'package:flutter/material.dart';
import 'package:poke/components/atoms/type_chip.dart';
import 'package:poke/domain/models/pokemon_types.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'User form', type: TypeChip)
Widget buildTypeChipUseCase(BuildContext context) {
  PokemonTypes types =
      context.knobs.list(label: 'Types', options: PokemonTypes.values);
  return Scaffold(
    body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TypeChip(type: types),
        const Divider(),
        const TypeChip(type: PokemonTypes.dragon),
        const Divider(),
        const TypeChip(type: PokemonTypes.rock)
      ]),
    ),
  );
}
