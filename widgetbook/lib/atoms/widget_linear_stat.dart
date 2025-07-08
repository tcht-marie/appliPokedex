import 'package:flutter/material.dart';
import 'package:poke/components/atoms/linear_stat.dart';
import 'package:poke/domain/models/pokemon_types.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: "Linear stat", type: LinearStat)
Widget buildLinearStatUseCase(BuildContext context) {
  double value =
      context.knobs.double.input(label: 'base stat', initialValue: 45);
  PokemonTypes types =
      context.knobs.list(label: 'Types', options: PokemonTypes.values);
  return Scaffold(
      body: Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: LinearStat(value: value, types: types))));
}
