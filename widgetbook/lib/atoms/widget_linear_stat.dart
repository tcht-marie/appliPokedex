
import 'package:flutter/cupertino.dart';
import 'package:poke/components/linear_stat.dart';
import 'package:poke/domain/models/pokemon_types.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: "Linear stat", type: LinearStat)
Widget buildLinearStatUseCase(BuildContext context) {
  double value = context.knobs.double.input(label: 'base stat', initialValue: 45);
  PokemonTypes types = context.knobs.list(
      label: 'Types',
      options: PokemonTypes.values
  );
  return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
    child: LinearStat(value: value, types: types)
  );
}