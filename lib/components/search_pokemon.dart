import 'package:flutter/material.dart';

import '../config/colors.dart';

class SearchPokemon extends StatefulWidget {
  final Function(String) setQuery;
  final Function(String) search;
  final Function() clearQuery;

  const SearchPokemon({super.key,
    required this.setQuery,
    required this.search,
    required this.clearQuery});

  @override
  State<SearchPokemon> createState() => _SearchPokemonState();
}

class _SearchPokemonState extends State<SearchPokemon> {

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 25),
      child: SearchBar(
        controller: _searchController,
        shadowColor: WidgetStatePropertyAll(PokedexColors.grayScale[000]),
        backgroundColor: WidgetStatePropertyAll(PokedexColors.grayScale[100]),
        padding: const WidgetStatePropertyAll(
            EdgeInsets.only(left: 10, top: 7, bottom: 7)),
        constraints: const BoxConstraints(
          maxWidth: 300,
          minHeight: 35,
        ),
        hintText: "Search",
        textStyle:
            WidgetStatePropertyAll(Theme.of(context).textTheme.labelSmall),
        leading: Icon(color: PokedexColors.identity, Icons.search),
        onChanged: (input) {
          widget.setQuery(input);
          widget.search(input);
        },
        trailing: [
          IconButton(
            onPressed: () {
              widget.clearQuery();
              _searchController.clear();
            },
            icon: Icon(color: PokedexColors.identity, Icons.clear),
          )
        ],
      ),
    );
  }
}
