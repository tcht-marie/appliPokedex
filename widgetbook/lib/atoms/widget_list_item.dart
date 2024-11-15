import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke/components/list_item.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'List item', type: ListItem)
Widget buildListIemUseCase(BuildContext context) {
  String category =
      context.knobs.string(label: 'Category', initialValue: 'standard-balls');

  String effect = context.knobs.string(
      label: 'Effect', initialValue: 'Catches a wild Pokémon every time.');

  return Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [ListItem(item: category), ListItem(item: effect)],
    ),
  );
}
