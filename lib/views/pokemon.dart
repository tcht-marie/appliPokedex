import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke/components/features.dart';
import 'package:poke/components/pokemon_header.dart';
import 'package:poke/components/type_chip.dart';
import 'package:poke/config/colors.dart';
import 'package:poke/domain/models/complete_pokemon.dart';
import 'package:poke/domain/models/pokemon_stat.dart';
import 'package:poke/domain/models/pokemon_types.dart';
import 'package:poke/domain/models/stat_name.dart';
import 'package:poke/domain/services/pokemon_service.dart';

import '../components/stat_pokemon.dart';

class PokemonComplete extends StatefulWidget {
  final PokemonService pokemonService;
  final int pokemonId;

  const PokemonComplete(
      {super.key, required this.pokemonService, required this.pokemonId});

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
        builder:
            (BuildContext context, AsyncSnapshot<CompletePokemon> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading Pokémon data'));
          } else if (snapshot.hasData) {
            final pokemon = snapshot.data!;

            //TODO : background dynamic selon type du pokemon
            return Container(
              color: PokedexColors.colorTypes(pokemon.pokemonTypes.first),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PokemonHeader(name: pokemon.name, idLabel: pokemon.idLabel),
                    Expanded(
                        flex: 0,
                        child: Image.network(
                            width: 200, height: 200, pokemon.imageUrl)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Wrap(
                          spacing: 16,
                          children: pokemon.pokemonTypes
                              .map((type) => TypeChip(type: type))
                              .toList(growable: false),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Features(
                                iconData: Icons.monitor_weight_outlined,
                                features: ['${pokemon.weight} kg'],
                                label: "Weight"),
                          ),
                          Expanded(
                            child: Features(
                                iconData: Icons.straighten,
                                features: ['${pokemon.height} m'],
                                label: "Height"),
                          ),
                          Expanded(
                            child: Features(
                                features: pokemon.abilities, label: "Moves"),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(pokemon.flavorText),
                    ),
                    StatPokemon(pokemonStats: pokemon.pokemonStat),
                  ],
                ),
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
