import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke/components/version_box.dart';

import '../components/poke_nav_bar.dart';
import '../config/providers.dart';
import '../domain/models/version.dart';

class Versions extends ConsumerWidget {

  const Versions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Versions",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: FutureBuilder(
            future: ref.read(pokemonServiceProvider).getVersions(),
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
