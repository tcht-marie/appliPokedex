import 'package:flutter/material.dart';
import 'package:poke/domain/models/pokemon_types.dart';
import '../../config/colors.dart';

class LinearStat extends StatelessWidget {
  final double value;
  final PokemonTypes types;

  const LinearStat({super.key, required this.value, required this.types});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.centerStart, children: [
      LinearProgressIndicator(
        value: 1,
        color: PokedexColors.colorTypes(types).withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
        //minHeight: 5,
      ),
      LinearProgressIndicator(
        value: value / 255.0,
        backgroundColor: Colors.transparent,
        color: PokedexColors.colorTypes(types),
        borderRadius: BorderRadius.circular(8),
        //minHeight: 5,
      ),
    ]);
  }
}
