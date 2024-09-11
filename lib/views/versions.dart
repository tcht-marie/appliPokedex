import 'package:flutter/material.dart';
import 'package:poke/components/version_box.dart';
import 'package:poke/domain/services/pokemon_service.dart';

import '../components/poke_nav_bar.dart';
import '../domain/models/version.dart';

class Versions extends StatelessWidget {
  final PokemonService pokemonService;

  const Versions({super.key, required this.pokemonService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Versions",
            // TODO : voir pour ne pas devoir surcharger le style ici (AppBarTheme)
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: FutureBuilder(
            future: pokemonService.getVersions(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Version>> snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, index) {
                    final version = snapshot.data![index];
                    return VersionBox(name: version.name, url: version.url);
                  },
                  itemCount: snapshot.data?.length,
                );
              } else if (snapshot.hasError) {
                return const Text('Error loading versions');
              } else {
                return const CircularProgressIndicator();
              }
            }),
        bottomNavigationBar: const PokeNavBar(index: 2));
  }
}
