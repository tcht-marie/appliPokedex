
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/colors.dart';

class InputForm extends StatelessWidget {
  final String text;
  final IconData icons;

  const InputForm({super.key, required this.text, required this.icons});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(
            color: PokedexColors.identity, icons),
        label: Text(text),
      ),
    );
  }
}