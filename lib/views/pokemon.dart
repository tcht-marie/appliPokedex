import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke/domain/models/complete_pokemon.dart';
import 'package:poke/domain/services/pokemon_service.dart';

class PokemonComplete extends StatefulWidget {
  final PokemonService pokemonService;
  final int pokemonId;

  const PokemonComplete({super.key, required this.pokemonService, required this.pokemonId});

  @override
  State<PokemonComplete> createState() => _PokemonCompleteState();
}

class _PokemonCompleteState extends State<PokemonComplete> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pokemon",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: FutureBuilder<CompletePokemon>(
        future: widget.pokemonService.getPokemonById(id: widget.pokemonId),
        builder: (BuildContext context, AsyncSnapshot<CompletePokemon> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading Pokémon data'));
          } else if (snapshot.hasData) {
            final pokemon = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Image.network(pokemon.imageUrl),
                  Text('ID: ${pokemon.id}'),
                  Text('Name: ${pokemon.name}'),
                  Text('Weight: ${pokemon.weight}'),
                  Text('Height: ${pokemon.height}'),
                  //Text('Cries: ${pokemon.cries}'),
                  Text('Abilities: ${pokemon.abilities.join(', ')}'),
                  Text('Types: ${pokemon.pokemonTypes.map((type) => type.name).join(', ')}'),
                ],
              ),
            );
          } else {
            return const Center(child: Text('No Pokémon data found'));
          }
        },
      ),
    );
  }
}
