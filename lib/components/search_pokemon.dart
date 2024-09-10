import 'package:flutter/material.dart';

import '../config/colors.dart';

class SearchPokemon extends StatelessWidget {
  const SearchPokemon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 25),
      child: SearchBar(
        shadowColor: WidgetStatePropertyAll(PokedexColors.grayScale[000]),
        backgroundColor: WidgetStatePropertyAll(PokedexColors.grayScale[100]),
        padding: const WidgetStatePropertyAll(EdgeInsets.only(left: 10, top: 7, bottom: 7)),
        constraints: const BoxConstraints(
          maxWidth: 300,
          minHeight: 35,
        ),
        hintText: "Search",
        textStyle: WidgetStatePropertyAll(Theme.of(context).textTheme.labelSmall),
        leading: Icon(color: PokedexColors.identity, Icons.search),
        /*trailing: [
          IconButton(
            onPressed: () {},
            icon: Icon(color: PokedexColors.identity, Icons.close),
          )
        ],*/
      ),
    );
  }
}
