import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke/components/atoms/list_item.dart';
import 'package:poke/config/providers.dart';
import 'package:poke/core/widget_keys.dart';
import 'package:poke/domain/models/item_details.dart';

import '../components/organisms/poke_nav_bar.dart';

/// Widget avec state et  utilise riverpod  via ConsumerStateWidget
/// Affiche une liste d'objet ItemDetails et utilise un ScrollController
class Items extends ConsumerStatefulWidget {
  const Items({super.key});

  @override
  ConsumerState<Items> createState() => _ItemsState();
}

/// État associé au ConsumerStatefulWidget Items
class _ItemsState extends ConsumerState<Items> {
  // variables d'état
  static const int _limit = 20;
  int _offset = 0;
  bool _hasNextPage = true;
  bool _isFirstLoadRunning = false;
  bool _isLoadMoreRunning = false;

  List<ItemDetails> _items = []; // liste des éléments chargés

  // fonction pour charger les premiers éléments
  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    try {
      // récupération des éléments en appelant le pokemonService
      final itemPage = await ref
          .read(pokemonServiceProvider)
          .getItemDetailsByPage(limit: _limit, offset: _offset);
      setState(() {
        _items = itemPage; // mise à jour de la liste d'éléments
      });
    } catch (error) {
      if (kDebugMode) {
        print('Something went wrong');
      }
    }
    setState(() {
      _isFirstLoadRunning = false; // fin du chargement initial
    });
  }

  // initialisation du controller pour le scroll
  late ScrollController _controller;

  // fonction pour charger plus d'éléments lors du scroll
  void _loadMore() async {
    if (_hasNextPage &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 300) {
      setState(() {
        _isLoadMoreRunning = true;
      });
      _offset += _limit; // mise à jour de l'offset
      try {
        // récupération des éléments en appelant le pokemonService avec l'offset modifié
        final itemPage = await ref
            .read(pokemonServiceProvider)
            .getItemDetailsByPage(limit: _limit, offset: _offset);
        setState(() {
          // ajout des nouveaux éléments en gardant aussi ceux d'avant
          _items = [..._items, ...itemPage];
        });
        // pas de page suivante si moins d'éléments que la limite
        if (itemPage.length < _limit) {
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
        _isLoadMoreRunning = false; // fin du chargement supplémentaire
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
          "Items",
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
                      key: WidgetKeys.items,
                      controller: _controller,
                      itemCount: _items.length,
                      itemBuilder: (BuildContext context, index) {
                        final item = _items[index];
                        return ExpansionTile(
                          key: WidgetKeys.detailsItem,
                          leading: Image.network(item.spriteUrl),
                          title: Text(
                              style: Theme.of(context).textTheme.titleMedium,
                              item.name),
                          children: <Widget>[
                            ListItem(item: item.effect),
                            ListItem(item: 'Category: ${item.category}'),
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
      bottomNavigationBar: const PokeNavBar(index: 1),
    );
  }
}
