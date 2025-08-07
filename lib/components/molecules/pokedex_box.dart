import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poke/core/widget_keys.dart';
import '../../config/colors.dart';

class PokedexBox extends StatelessWidget {
  final String idLabel;
  final String name;
  final String imageUrl;
  final int id;
  final Widget? pokedexAction;

  const PokedexBox({
    super.key,
    required this.idLabel,
    required this.name,
    required this.imageUrl,
    required this.id,
    this.pokedexAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: WidgetKeys.completePokemon,
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(blurRadius: 3.0, spreadRadius: 1.0, offset: Offset(0, 1))
        ],
        color: PokedexColors.grayScale[100],
        borderRadius: BorderRadius.circular(8),
      ),
      // Stack = pour superposer les widgets
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: pokedexAction == null
                      ? Padding(
                          padding: const EdgeInsets.only(top: 8, right: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                idLabel,
                                textAlign: TextAlign.end,
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ],
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            pokedexAction!,
                            Text(
                              idLabel,
                              textAlign: TextAlign.end,
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        )),
            ],
          ),
          // place le container du nom du pokemon en bas
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: PokedexColors.grayScale[075],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
            ),
          ),
          // place l'image du pokemon au centre et un peu en haut
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () => context.push('/pokemon/$id'),
              child: Image.network(
                imageUrl,
                fit: BoxFit.scaleDown,
                width: 83,
                height: 83,
              ),
            ),
          )
        ],
      ),
    );
  }
}
