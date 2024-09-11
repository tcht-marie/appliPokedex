import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poke/components/evo_chip.dart';
import 'package:poke/components/features.dart';
import 'package:poke/components/poke_nav_bar.dart';
import 'package:poke/components/type_chip.dart';
import 'package:poke/config/colors.dart';
import 'package:poke/config/router.dart';
import 'package:poke/domain/models/complete_pokemon.dart';
import 'package:poke/domain/services/pokemon_service.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:poke/views/pokedex.dart';

import '../components/stat_pokemon.dart';

class PokemonComplete extends StatefulWidget {
  final PokemonService pokemonService;
  final String pokemonId;

  const PokemonComplete(
      {super.key, required this.pokemonService, required this.pokemonId});

  @override
  State<PokemonComplete> createState() => _PokemonCompleteState();
}

class _PokemonCompleteState extends State<PokemonComplete> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CompletePokemon>(
      // appel au service pour récup data d'un pokemon
      future:
          widget.pokemonService.getPokemonById(id: int.parse(widget.pokemonId)),
      builder: (BuildContext context, AsyncSnapshot<CompletePokemon> snapshot) {
        // affichage d'un indicateur de chargement pendant la récup des datas
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading Pokémon data'));
          // affichage pokemon si data
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
              leading: IconButton(
                icon: Icon(
                    color: PokedexColors.grayScale[100],
                    size: 30,
                    Icons.arrow_back),
                onPressed: () => context.pop(),
              ),
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
                    // pour le fond blanc derrière les autres éléments
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              pokemon.id == 1
                                  ? const Icon(
                                      color: Colors.transparent,
                                      Icons.arrow_back_ios_new_outlined)
                                  : IconButton(
                                      onPressed: () => context
                                          .push('/pokemon/${pokemon.id - 1}'),
                                      icon: Icon(
                                          color: PokedexColors.grayScale[100],
                                          Icons.arrow_back_ios_new_outlined)),
                              Expanded(
                                flex: 0,
                                /*child: GestureDetector(
                                onTap: () async {
                                  //print(pokemon.cries);
                                  await AudioPlayer().play(UrlSource(pokemon.cries, mimeType: 'audio/ogg'));
                                },*/
                                child: Image.network(
                                    width: 230, height: 230, pokemon.imageUrl),
                                //)
                              ),
                              pokemon.id == 1025
                                  ? const Icon(
                                      color: Colors.transparent,
                                      Icons.arrow_back_ios_new_outlined)
                                  : IconButton(
                                      onPressed: () => context
                                          .push('/pokemon/${pokemon.id + 1}'),
                                      icon: Icon(
                                          color: PokedexColors.grayScale[100],
                                          Icons.arrow_forward_ios_outlined)),
                            ],
                          ),
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
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Text(
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
                          ),
                          Row(
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
                              ),
                              Expanded(
                                child: Features(
                                    features: pokemon.abilities,
                                    label: "Moves"),
                              ),
                            ],
                          ),
                          Text(
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    height: 1.5,
                                  ),
                              pokemon.flavorText),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      color: PokedexColors.colorTypes(
                                          pokemon.pokemonTypes.first),
                                    ),
                                "Base Stats"),
                          ),
                          StatPokemon(
                              pokemonStats: pokemon.pokemonStat,
                              types: pokemon.pokemonTypes.first),
                          EvoChip(pokemon: pokemon),
                        ],
                      ),
                    ),
                  ],
                )),
            bottomNavigationBar: const PokeNavBar(index: 0),
          );
          // si aucune datas trouvées, affiche juste une appbar et un text
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
