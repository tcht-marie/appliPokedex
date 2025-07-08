import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:poke/components/atoms/logout.dart';
import 'package:poke/components/atoms/text_my_pokedex.dart';
import 'package:poke/components/molecules/pokedex_box.dart';
import 'package:poke/config/providers.dart';
import 'package:poke/core/widget_keys.dart';

import '../components/organisms/poke_nav_bar.dart';
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
        actions: const [Logout()],
      ),
      body: FutureBuilder(
          future: ref.watch(pokemonServiceProvider).getTrainerPokedex(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Pokemon>> snapshot) {
            // TODO : voir async value (onData, onError...)
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
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: pokemon.isNotEmpty
                              ? TextMyPokedex(
                                  description:
                                      "Long press here to reset your Pokédex.",
                                  action: () {
                                    ref
                                        .read(pokemonServiceProvider)
                                        .deleteAllPokemonsToPokedexTrainer();
                                    ref
                                        .refresh(pokemonServiceProvider)
                                        .getTrainerPokedex();
                                  })
                              : TextMyPokedex(
                                  key: WidgetKeys.userPokedexEmpty,
                                  action: () => context.push("/pokedex"),
                                  description:
                                      "Your Pokédex is empty. To add your Pokémons, long press here to go to Pokédex page.")),
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
                                        iconSize: 16,
                                        onPressed: () async {
                                          await ref
                                              .read(pokemonServiceProvider)
                                              .deletePokemonToPokedexTrainer(
                                                  pokedex.id);
                                          ref
                                              .refresh(pokemonServiceProvider)
                                              .getTrainerPokedex();
                                        },
                                        icon: Icon(
                                            color: PokedexColors.identity,
                                            Icons.remove)));
                              }))
                    ],
                  ),
                ),
              );
            } else {
              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    "My Pokédex",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                body: const Center(child: Text('No Pokémon data found')),
              );
            }
          }),
      bottomNavigationBar: const PokeNavBar(index: 4),
    );
  }
}
