import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../config/colors.dart';

class HomeButton extends StatelessWidget {
  final String name;
  final String path;

  const HomeButton({super.key, required this.name, required this.path});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => context.push(path),
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(PokedexColors.identity),
          fixedSize: const WidgetStatePropertyAll(Size(130, 50)),
        ),
        child: Text(name, style: Theme.of(context).textTheme.titleSmall));
  }
}
