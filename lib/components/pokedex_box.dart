import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke/config/colors.dart';

class PokedexBox extends StatelessWidget {
  final String idLabel;
  final String name;
  final String imageUrl;

  const PokedexBox(
      {super.key,
      required this.idLabel,
      required this.name,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(6.0),
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  blurRadius: 3.0,
                  spreadRadius: 1.0,
                  offset: const Offset(0, 1))
            ],
            color: PokedexColors.grayScale[100],
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flex(
              direction: Axis.horizontal,
              textDirection: TextDirection.rtl,
              children: [
                Text(
                  idLabel,
                  textAlign: TextAlign.end,
                  textDirection: TextDirection.ltr,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            Expanded(
                child: Image.network(
              imageUrl,
              fit: BoxFit.scaleDown,
              width: 72,
              height: 72,
            )),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Text(name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: '${Theme.of(context).textTheme.bodySmall}',
                  )),
            ),
          ],
        ));
  }
}
