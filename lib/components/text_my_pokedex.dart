import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../config/colors.dart';

class TextMyPokedex extends StatelessWidget {
  final VoidCallback action;
  final String description;

  const TextMyPokedex(
      {super.key, required this.action, required this.description});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: action,
      child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: PokedexColors.ground,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
              textAlign: TextAlign.center,
              description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  height: 1.3,
                  color: PokedexColors.grayScale[100],
                  fontWeight: FontWeight.bold))),
    );
  }
}
