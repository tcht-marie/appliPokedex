import 'package:flutter/material.dart';
import 'package:poke/config/colors.dart';
import 'package:poke/domain/models/pokemon_types.dart';

class PokemonHeader extends StatelessWidget {
  final String name;
  final String idLabel;

  const PokemonHeader({super.key, required this.name, required this.idLabel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Icon(Icons.arrow_back),
        Text(style: Theme.of(context).textTheme.headlineSmall, name),
        Padding(
          padding: const EdgeInsets.only(left: 150),
          child: Text(style: Theme.of(context).textTheme.titleMedium, idLabel),
        )
      ],
    );
  }
}
