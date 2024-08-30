import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke/config/colors.dart';

class PokedexBox extends StatelessWidget {
  final String idLabel;
  final String name;
  final String imageUrl;

  const PokedexBox({
    super.key,
    required this.idLabel,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(blurRadius: 3.0, spreadRadius: 1.0, offset: Offset(0, 1))
        ],
        color: PokedexColors.grayScale[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      idLabel,
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
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
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Image.network(
              imageUrl,
              fit: BoxFit.scaleDown,
              width: 83,
              height: 83,
            ),
          ),
        ],
      ),
    );
  }
}