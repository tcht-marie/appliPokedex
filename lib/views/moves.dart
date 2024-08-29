import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:poke/domain/services/pokemon_service.dart';

import '../domain/models/move_details.dart';

class Moves extends StatefulWidget {
  final PokemonService pokemonService;

  const Moves({super.key, required this.pokemonService});

  @override
  State<Moves> createState() => _MovesState();
}

class _MovesState extends State<Moves> {
  static const int _limit = 20;
  late int _offset = 0;

  bool _hasNextPage = true;
  bool _isFirstLoadRunning = false;
  bool _isLoadMoreRunning = false;

  List<MoveDetails> _moves = [];

  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    try {
      final movePage =
          await widget.pokemonService.getMoveDetailsByPage(_limit, _offset);
      setState(() {
        _moves = movePage;
      });
    } catch (error) {
      if (kDebugMode) {
        print('Something went wrong');
      }
    }
    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  late ScrollController _controller;

  // fonction pour charger plus d'éléments lors du scroll
  void _loadMore() async {
    // s'il y a une page suivante &
    if (_hasNextPage &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        // .position = donne accès à la position actuelle du scroll
        // .extentAfter = représente la distance entre la position actuelle et la fin du contenu défilable
        // vérifié si user est proche de la fin de la zone scrollable (moins de 300 pixels)
        _controller.position.extentAfter < 300) {
      setState(() {
        // début du chargement supplémentaire
        _isLoadMoreRunning = true;
      });
      // mise à jour de l'offset
      _offset += _limit;
      try {
        // récupération des éléments en appelant le pokemonService avec l'offset modifié
        final movePage =
            await widget.pokemonService.getMoveDetailsByPage(_limit, _offset);
        setState(() {
          // ajout des nouveaux éléments en gardant aussi ceux d'avant
          _moves = [..._moves, ...movePage];
        });
        // pas de page suivante si moins d'éléments que la limite
        if (movePage.length < _limit) {
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
          title: Text(
            "Move Details",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: _isFirstLoadRunning
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(children: [
                Expanded(
                    child: ListView.builder(
                        // controller
                        controller: _controller,
                        // nombre d'éléments dans la liste
                        itemCount: _moves.length,
                        itemBuilder: (BuildContext context, index) {
                          final move = _moves[index];
                          return ExpansionTile(
                            title: Text(move.name),
                            children: <Widget>[
                              ListTile(title: Text('Power : ${move.power}')),
                              ListTile(title: Text('PP: ${move.pp}')),
                              ListTile(
                                  title: Text('Flavor = ${move.flavorText}')),
                            ],
                          );
                        })),
                if (_isLoadMoreRunning)
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 40),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
              ]));
  }
}
