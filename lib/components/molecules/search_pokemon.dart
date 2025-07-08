import 'package:flutter/material.dart';

import '../../config/colors.dart';

class SearchPokemon extends StatefulWidget {
  final Function(String) setQuery;
  final Function(String) search;
  final Function() clearQuery;

  const SearchPokemon(
      {super.key,
      required this.setQuery,
      required this.search,
      required this.clearQuery});

  @override
  State<SearchPokemon> createState() => _SearchPokemonState();
}

class _SearchPokemonState extends State<SearchPokemon> {
  // controller pou gérer le texte saisi dans la search bar
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 25),
      child: SearchBar(
        // utilisation du controller
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
        // fonction appelée à chaque changement de texte dans la search bar
        onChanged: (input) {
          widget.setQuery(input);
          widget.search(input);
        },
        // icons.clear affichée que si du texte est présent
        trailing: [
          // widget qui reconstruit son enfant chaque fois que la valeur change
          ValueListenableBuilder<TextEditingValue>(
            // la valeur vient du controller. A chaque changement, le builder est appelé
            valueListenable: _searchController,
            // context : contexte de construction / value : valeur actuelle du controller / child : widget enfant statique (non utilisé mais obligatoire)
            builder: (context, value, child) {
              // si le text du controller n'est pas vide
              return value.text.isNotEmpty
                  // sizedBox avec hauteur fixe pour que la search bar garde la même taille malgrè l'affichage de l'icon clear
                  ? SizedBox(
                      height: 35,
                      // return iconButton
                      child: IconButton(
                        onPressed: () {
                          // fonction pour effacer ce qui se trouve dans query (relié dans view pokedex)
                          widget.clearQuery();
                          // efface le texte du controller (donc de l'input)
                          _searchController.clear();
                        },
                        icon: Icon(
                            color: PokedexColors.identity,
                            size: 20,
                            Icons.clear),
                      ),
                    )
                  // sinon return widget invisible et sans taille
                  : const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
