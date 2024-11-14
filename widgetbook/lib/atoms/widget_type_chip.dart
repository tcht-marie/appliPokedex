

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke/components/type_chip.dart';
import 'package:poke/domain/models/pokemon_types.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'User form', type: TypeChip)
Widget buildTypeChipUseCase(BuildContext context) {
  PokemonTypes types = context.knobs.list(
      label: 'Types',
      options: PokemonTypes.values
  );
  return Padding(
      padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 8),
      child: TypeChip(type: types)
  );
}
