import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:poke/domain/models/item_details.dart';
import 'package:poke/domain/services/pokemon_service.dart';

class Items extends StatefulWidget {
  final PokemonService pokemonService;

  const Items({super.key, required this.pokemonService});

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  static const int _limit = 20;
  int _offset = 0;

  // There is next page or not
  bool _hasNextPage = true;

  // Used to display loading indicators when _firstLoad function is running
  bool _isFirstLoadRunning = false;

  // Used to display loading indicators when _loadMore function is running
  bool _isLoadMoreRunning = false;

  // This holds the posts fetched from the server
  List<ItemDetails> _items = [];

  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    try {
      final itemPage = await widget.pokemonService
          .getItemDetailsByPage(limit: _limit, offset: _offset);
      setState(() {
        _items = itemPage;
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

  // The controller for the ListView
  late ScrollController _controller;

  void _loadMore() async {
    if (_hasNextPage &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 300) {
      setState(() {
        _isLoadMoreRunning = true; // Display a progress indicator at the bottom
      });
      _offset += _limit;
      try {
        final itemPage = await widget.pokemonService
            .getItemDetailsByPage(limit: _limit, offset: _offset);
        setState(() {
          _items = [..._items, ...itemPage];
        });
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
        _isLoadMoreRunning = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _firstLoad();
    _controller = ScrollController()..addListener(_loadMore);
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Item Details",
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
                        controller: _controller,
                        itemCount: _items.length,
                        itemBuilder: (BuildContext context, index) {
                          final item = _items[index];
                          return ExpansionTile(
                            leading: Image.network(item.spriteUrl),
                            title: Text(item.name),
                            children: <Widget>[
                              ListTile(title: Text(item.effect)),
                              ListTile(
                                  title: Text('Category: ${item.category}')),
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
