import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke/components/logout.dart';
import 'package:poke/components/pokedex_box.dart';
import 'package:poke/config/providers.dart';

import '../components/poke_nav_bar.dart';
import '../config/colors.dart';
import '../domain/models/pokemon.dart';

class MyPokedex extends ConsumerWidget {
  const MyPokedex({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Pokedex",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: const [
          Logout(),
        ],
      ),
      body: FutureBuilder(
          future: ref.read(pokemonServiceProvider).getTrainerPokedex(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Pokemon>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(
                  child: Text('Error loading your pokedex data'));
            } else if (snapshot.hasData) {
              final pokemon = snapshot.data!;

              return Container(
                color: PokedexColors.grayScale[100],
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      Expanded(
                          child: GridView.builder(
                              itemCount: pokemon.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemBuilder: (BuildContext context, index) {
                                final pokedex = pokemon[index];
                                return PokedexBox(
                                    idLabel: pokedex.idLabel,
                                    name: pokedex.name,
                                    imageUrl: pokedex.imageUrl,
                                    id: pokedex.id,
                                    pokedexAction: IconButton(
                                        visualDensity: const VisualDensity(
                                            horizontal: -4, vertical: -4),
                                        iconSize: 12,
                                        onPressed: () async {
                                          await ref
                                              .read(pokemonServiceProvider)
                                              .deletePokemonToPokedexTrainer(
                                                  pokedex.id);
                                          ref.refresh(pokemonServiceProvider).getTrainerPokedex();
                                        },
                                        icon: const Icon(Icons.remove)));
                              }))
                    ],
                  ),
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
          }),
      bottomNavigationBar: const PokeNavBar(index: 4),
    );
  }
}
