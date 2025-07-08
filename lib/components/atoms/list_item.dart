import 'package:flutter/material.dart';

import '../../config/colors.dart';

class ListItem extends StatelessWidget {
  final String item;

  const ListItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: PokedexColors.ground,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: ListTile(
          title: Text(
              style: TextStyle(
                color: PokedexColors.grayScale[000],
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
              item)),
    );
  }
}
