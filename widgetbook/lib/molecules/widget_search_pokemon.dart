import 'package:flutter/material.dart';
import 'package:poke/components/molecules/search_pokemon.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Search pokemon with search bar', type: SearchPokemon)
Widget buildSearchPokemonUseCase(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SearchPokemon(
              setQuery: (search) {},
              search: (search) {
                context.knobs.string(label: 'search');
              },
              clearQuery: () {})),
    ),
  );
}
