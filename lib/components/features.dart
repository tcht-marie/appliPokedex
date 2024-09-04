import 'package:flutter/material.dart';

class Features extends StatelessWidget {
  //TODO : changer feature en string dans le back + convertir valeur
  final List<String> features;
  final IconData? iconData;
  final String label;

  const Features(
      {super.key, required this.features, this.iconData, required this.label});

  @override
  Widget build(BuildContext context) {
    return iconData != null
        ? Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(iconData),
                  Wrap(
                    children: features
                        .map((feature) => Text(
                            style: Theme.of(context).textTheme.bodySmall,
                            feature))
                        .toList(growable: false),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child:
                    Text(style: Theme.of(context).textTheme.labelSmall, label),
              ),
            ],
          )
        : Column(
            children: [
              Wrap(
                runSpacing: 10,
                children: features
                    .map((feature) => Text(
                        style: Theme.of(context).textTheme.bodySmall, feature))
                    .toList(growable: false),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child:
                    Text(style: Theme.of(context).textTheme.labelSmall, label),
              ),
            ],
          );
  }
}
