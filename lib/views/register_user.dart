import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke/components/input_form.dart';
import 'package:poke/config/colors.dart';
import 'package:poke/domain/services/pokemon_service.dart';

import '../domain/models/pokemon.dart';

// TODO : à faire ailleurs que dans le register (add pokemon in pokedex trainer)
class RegisterUser extends StatefulWidget {
  final PokemonService pokemonService;
  final int id;

  const RegisterUser(
      {super.key, required this.pokemonService, required this.id});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Pokemon>(
        future: widget.pokemonService.addPokemonToPokedexTrainer(widget.id),
        builder: (BuildContext context, AsyncSnapshot<Pokemon> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading Pokémon data'));
            // affichage pokemon si data
          } else if (snapshot.hasData) {
            final pokemon = snapshot.data!;

            return Scaffold(
              appBar: AppBar(
                title: Text(
                  "Register",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              body: Container(
                padding: const EdgeInsets.all(30),
                color: PokedexColors.grayScale[100],
                child: Form(
                  child: Column(
                    children: [
                      const InputForm(
                          text: 'Username', icons: Icons.person_outline),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: InputForm(
                            text: 'Password', icons: Icons.password_outlined),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: ActionChip(
                          backgroundColor: PokedexColors.identity,
                          padding: const EdgeInsets.all(15),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          side: const BorderSide(width: 0),
                          onPressed: () {},
                          label: Text(
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    color: PokedexColors.grayScale[100],
                                  ),
                              'Submit'),
                        ),
                      )
                    ],
                  ),
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
        });
  }
}
