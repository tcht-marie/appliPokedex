
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/colors.dart';

class InputForm extends StatelessWidget {
  final String text;
  final IconData icons;
  final Function stateRegister;

  const InputForm({super.key, required this.text, required this.icons, required this.stateRegister});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (String value) =>
        stateRegister(value),
      decoration: InputDecoration(
        icon: Icon(
            color: PokedexColors.identity, icons),
        label: Text(text),
      ),
    );
  }
}