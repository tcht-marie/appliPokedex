import 'package:flutter/material.dart';
import 'package:poke/components/text_my_pokedex.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: "Text in my pokedex", type: TextMyPokedex)
Widget buildTextMyPokedexUseCase(BuildContext context) {
  return Padding(
      padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 8),
      child: TextMyPokedex(
          action: () {},
          description: context.knobs.string(
              label: 'text',
              initialValue:
                  "Your Pokédex is empty. To add your Pokémons, long press here to go to Pokédex page.")));
}
