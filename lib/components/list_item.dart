import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/colors.dart';

class ListItem extends StatelessWidget {
  final String item;

  const ListItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: PokedexColors.identity,
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
          title: Text(
              style: TextStyle(
                color: PokedexColors.grayScale[100],
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              item)),
    );
  }
}
