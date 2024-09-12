import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:poke/components/search_pokemon.dart';
import 'package:poke/config/colors.dart';
import 'package:poke/domain/models/pokemon.dart';
import 'package:poke/domain/services/pokemon_service.dart';

import '../components/poke_nav_bar.dart';
import '../components/pokedex_box.dart';

class Pokedex extends StatefulWidget {
  final PokemonService pokemonService;

  const Pokedex({super.key, required this.pokemonService});

  @override
  State<Pokedex> createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  static const int _limit = 20;
  late int _offset = 0;
  String _query = '';

  // pour gérer l'état de chargement
  bool _hasNextPage = true;
  bool _isFirstLoadRunning = false;
  bool _isLoadMoreRunning = false;

  List<Pokemon> _pokemons = [];

  // fonction pour charger les pokemon au premier chargement
  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    try {
      _offset = 0;
      _hasNextPage = true;
      final pokedexPage = await widget.pokemonService
          .getPokemonsByPage(limit: _limit, offset: _offset);
      setState(() {
        _pokemons = pokedexPage;
      });
      if (pokedexPage.length < _limit) {
        setState(() {
          _hasNextPage = false;
        });
      }
    } catch (error) {
      if (kDebugMode) {
        print('Something went wrong');
      }
    }
    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  // controller pour le scroll
  late ScrollController _controller;

  // fonction pour rechercher un pokemon par name
  void _searchPokemon(String input) async {
    _offset = 0;
    _hasNextPage = true;
    final searchQuery = await widget.pokemonService
        .getPokedexByName(limit: _limit, offset: _offset, query: input);
    if (searchQuery.length < _limit) {
      setState(() {
        _hasNextPage = false;
      });
    }
    setState(() {
      _pokemons = searchQuery;
    });
  }

  // fonction pour charger plus d'éléments lors du scroll
  void _loadMore() async {
    // s'il y a une page suivante & si aucun autre chargement
    if (_hasNextPage &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        // .position = donne accès à la position actuelle du scroll
        // .extentAfter = représente la distance entre la position actuelle et la fin du contenu défilable
        // vérifie si user est proche de la fin de la zone scrollable (moins de 300 pixels)
        _controller.position.extentAfter < 300) {
      setState(() {
        // début du chargement supplémentaire
        _isLoadMoreRunning = true;
      });
      // mise à jour de l'offset
      _offset += _limit;
      try {
        // récupération des éléments en appelant le pokemonService avec l'offset modifié
        final pokedexPage = _query.isEmpty
            ? await widget.pokemonService
                .getPokemonsByPage(limit: _limit, offset: _offset)
            : await widget.pokemonService.getPokedexByName(
                limit: _limit, offset: _offset, query: _query);
        setState(() {
          // ajout des nouveaux éléments en gardant aussi ceux d'avant
          _pokemons = [..._pokemons, ...pokedexPage];
        });
        // pas de page suivante si moins d'éléments que la limite
        if (pokedexPage.length < _limit) {
          setState(() {
            _hasNextPage = false;
          });
        }
      } catch (err) {
        if (kDebugMode) {
          print('Something went wrong!');
        }
      }
      setState(() {
        // fin du chargement supplémentaire
        _isLoadMoreRunning = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // chargement initial des éléments
    _firstLoad();
    // initialisation du controller de scroll
    _controller = ScrollController()..addListener(_loadMore);
  }

  @override
  void dispose() {
    // suppression du listener lors de la destruction
    _controller.removeListener(_loadMore);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(
          "Pokedex",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        bottom: PreferredSize(
          preferredSize: const Size(10, 10),
          child: SearchPokemon(
            // mettre à jour la recherche (ce que contient query)
            setQuery: (input) {
              setState(() {
                _query = input;
              });
            },
            // fonction pour rechercher un pokemon en fonction de ce qui est entré dans l'input
            search: (input) => _searchPokemon(input),
            // fonction pour effacer la recherche
            clearQuery: () {
              setState(() {
                _query = '';
              });
              // et recharge le pokedex initial
              _firstLoad();
            },
          ),
        ),
      ),
      body: _isFirstLoadRunning
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              color: PokedexColors.grayScale[100],
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        itemCount: _pokemons.length,
                        controller: _controller,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                        itemBuilder: (BuildContext context, index) {
                          final pokedex = _pokemons[index];
                          return PokedexBox(
                              id: pokedex.id,
                              name: pokedex.name,
                              idLabel: pokedex.idLabel,
                              imageUrl: pokedex.imageUrl);
                        },
                      ),
                    ),
                    if (_isLoadMoreRunning)
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 40),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                  ],
                ),
              ),
            ),
      bottomNavigationBar: const PokeNavBar(index: 0),
    );
  }
}
