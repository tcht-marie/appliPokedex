import 'package:flutter/material.dart';

class Features extends StatelessWidget {
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
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: Icon(size: 19, iconData),
                  ),
                  Wrap(
                    children: features
                        .map((feature) => Text(
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 14,
                                    ),
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
              //TODO : problème affichage avec un ou plusieurs moves
              Wrap(
                runSpacing: 10,
                children: features
                    .map((feature) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontSize: 14,
                                  ),
                              feature),
                        ))
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
