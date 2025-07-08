import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke/components/atoms/list_item.dart';
import 'package:poke/components/atoms/type_chip.dart';
import 'package:poke/config/providers.dart';
import 'package:poke/core/widget_keys.dart';

import '../components/organisms/poke_nav_bar.dart';
import '../domain/models/move_details.dart';

class Moves extends ConsumerStatefulWidget {
  const Moves({super.key});

  @override
  ConsumerState<Moves> createState() => _MovesState();
}

class _MovesState extends ConsumerState<Moves> {
  static const int _limit = 20;
  late int _offset = 0;

  bool _hasNextPage = true;
  bool _isFirstLoadRunning = false;
  bool _isLoadMoreRunning = false;

  List<MoveDetails> _moves = [];

  // fonction premier  chargement
  void _firstLoad() async {
    setState(() {
      // chargement initial en appelant fonction _isFirstLoadRunning
      _isFirstLoadRunning = true;
    });
    try {
      final movePage =
          // appel au pokemonService
          await ref
              .read(pokemonServiceProvider)
              .getMoveDetailsByPage(_limit, _offset);
      setState(() {
        // mise à jour de la liste
        _moves = movePage;
      });
    } catch (error) {
      if (kDebugMode) {
        print('Something went wrong');
      }
    }
    setState(() {
      // fin du chargement initial
      _isFirstLoadRunning = false;
    });
  }

  // controller de scroll
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
        final movePage = await ref
            .read(pokemonServiceProvider)
            .getMoveDetailsByPage(_limit, _offset);
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
          "Moves",
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
                      key: WidgetKeys.moves,
                      padding: const EdgeInsets.all(8),
                      // controller
                      controller: _controller,
                      // nombre d'éléments dans la liste
                      itemCount: _moves.length,
                      itemBuilder: (BuildContext context, index) {
                        final move = _moves[index];
                        return ExpansionTile(
                          key: WidgetKeys.detailsMoves,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          title: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.titleMedium,
                                move.name),
                          ),
                          // fleche pour ouvrir la tuile à gauche (de base elle est à droite)
                          controlAffinity: ListTileControlAffinity.leading,
                          trailing: TypeChip(type: move.pokemonTypes),
                          children: <Widget>[
                            ListItem(item: 'Power : ${move.power.toString()}'),
                            ListItem(item: 'PP : ${move.pp.toString()}'),
                            ListItem(item: move.flavorText),
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
            ]),
      bottomNavigationBar: const PokeNavBar(index: 3),
    );
  }
}
