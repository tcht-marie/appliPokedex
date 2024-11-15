import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke/components/features.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Features', type: Features)
Widget buildFeaturesUseCase(BuildContext context) {
  List<String> feature = context.knobs.list(label: 'Weight', options: [
    ['4.5 kg'],
    ['7 kg'],
    ['42kg'],
    ['9.8 kg']
  ]);

  String label = context.knobs.string(label: 'Label', initialValue: 'Weight');
  
  return Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Features(
            iconData: Icons.scale_outlined, features: feature, label: label)
      ],
    ),
  );
}
