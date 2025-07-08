import 'package:flutter/material.dart';
import 'package:poke/components/organisms//poke_nav_bar.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Nav bar', type: PokeNavBar)
Widget buildPokeNavBarUseCase(BuildContext context) {
  return Scaffold(
    bottomNavigationBar: PokeNavBar(
        index: context.knobs.int.input(label: 'index', initialValue: 0)),
  );
}
