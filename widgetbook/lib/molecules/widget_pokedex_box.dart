import 'package:flutter/material.dart';
import 'package:poke/components/molecules/pokedex_box.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Pokedexbox', type: PokedexBox)
Widget buildPokedexBoxUseCase(BuildContext context) {
  String id = context.knobs.string(label: 'id', initialValue: '4');
  return Scaffold(
    body: GridView(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      children: [
        PokedexBox(
            idLabel:
                context.knobs.string(label: 'idLabel', initialValue: '#0004'),
            name:
                context.knobs.string(label: 'name', initialValue: 'Charmander'),
            imageUrl:
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png',
            id: int.parse(id))
      ],
    ),
  );
}
