import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke/domain/models/item_details.dart';
import 'package:poke/domain/services/pokemon_service.dart';

class Items extends StatefulWidget {
  final PokemonService pokemonService;
  final int itemId;

  const Items({super.key, required this.pokemonService, required this.itemId});

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Item Details",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: FutureBuilder<ItemDetails>(
          future: widget.pokemonService.getItemDetailsById(id: widget.itemId),
          builder: (BuildContext context, AsyncSnapshot<ItemDetails> snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Name: ${snapshot.data!.name}'),
              );
            } else if (snapshot.hasError) {
              return const Text('Error loading item details');
            } else {
              return const CircularProgressIndicator();
            }
          },
        ));
  }
}

/*@override
  State<StatefulWidget> createState() {
  // TODO: implement createState
  throw UnimplementedError();
  }*/
