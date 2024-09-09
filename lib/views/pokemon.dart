import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke/components/evo_species.dart';
import 'package:poke/components/features.dart';
import 'package:poke/components/type_chip.dart';
import 'package:poke/config/colors.dart';
import 'package:poke/domain/models/complete_pokemon.dart';
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
    return FutureBuilder<CompletePokemon>(
      future: widget.pokemonService.getPokemonById(id: widget.pokemonId),
      builder: (BuildContext context, AsyncSnapshot<CompletePokemon> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading Pokémon data'));
        } else if (snapshot.hasData) {
          final pokemon = snapshot.data!;

          return Scaffold(
            appBar: AppBar(
              backgroundColor:
                  PokedexColors.colorTypes(pokemon.pokemonTypes.first),
              centerTitle: false,
              title: Text(
                  style: Theme.of(context).textTheme.headlineSmall,
                  pokemon.name),
              leading: Icon(
                  color: PokedexColors.grayScale[100],
                  size: 30,
                  Icons.arrow_back),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: PokedexColors.grayScale[100],
                          ),
                      pokemon.idLabel),
                ),
              ],
            ),
            body: Container(
                //color: Colors.white,
                color: PokedexColors.colorTypes(pokemon.pokemonTypes.first),
                child: Stack(
                  children: [
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        height: 530,
                        child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            decoration: BoxDecoration(
                              color: PokedexColors.grayScale[100],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                            ))),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              flex: 0,
                              child: Image.network(
                                  width: 230, height: 230, pokemon.imageUrl)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Wrap(
                                spacing: 20,
                                children: pokemon.pokemonTypes
                                    .map((type) => TypeChip(type: type))
                                    .toList(growable: false),
                              ),
                            ],
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: PokedexColors.colorTypes(
                                      pokemon.pokemonTypes.first),
                                ),
                            "About",
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6.0, horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Features(
                                      iconData: Icons.scale_outlined,
                                      features: ['${pokemon.weight} kg'],
                                      label: "Weight"),
                                ),
                                Container(
                                  width: 1.5,
                                  height: 70,
                                  color: PokedexColors.grayScale[050],
                                  //margin: const EdgeInsets.symmetric(horizontal: 10),
                                ),
                                Expanded(
                                  child: Features(
                                      iconData: Icons.height_outlined,
                                      features: ['${pokemon.height} m'],
                                      label: "Height"),
                                ),
                                Container(
                                  width: 1.5,
                                  height: 70,
                                  color: PokedexColors.grayScale[050],
                                  //margin: const EdgeInsets.symmetric(horizontal: 10),
                                ),
                                Expanded(
                                  child: Features(
                                      features: pokemon.abilities,
                                      label: "Moves"),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      height: 1.5,
                                    ),
                                pokemon.flavorText),
                          ),
                          Text(
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    color: PokedexColors.colorTypes(
                                        pokemon.pokemonTypes.first),
                                  ),
                              "Base Stats"),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: StatPokemon(
                                pokemonStats: pokemon.pokemonStat,
                                types: pokemon.pokemonTypes.first),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Expanded(
                                        child: EvoSpecies(
                                            evolvesTo: pokemon
                                                .evolutionChain.evolvesTo),
                                      );
                                    });
                              },
                              child: const Text('Evolutions'))
                          /**/
                        ],
                      ),
                    ),
                  ],
                )),
            // TODO : si nav bar, changer hauteur background white
            bottomNavigationBar: NavigationBar(
              backgroundColor:
                  PokedexColors.colorTypes(pokemon.pokemonTypes.first),
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.my_library_books_outlined),
                  label: 'Pokedex',
                ),
                NavigationDestination(
                  icon: Icon(Icons.list_outlined),
                  label: 'Versions',
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text("oups"),
            ),
            body: const Center(child: Text('No Pokémon data found')),
          );
        }
      },
    );
  }
}
