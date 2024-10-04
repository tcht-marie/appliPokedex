/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke/components/home_button.dart';

import '../components/poke_nav_bar.dart';
import '../config/colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pokémon Land",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Container(
        color: PokedexColors.grayScale[100],
        child: const Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Image(
                alignment: Alignment.topCenter,
                image: AssetImage("lib/assets/images/banniere_pokemon.jpg"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 150),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HomeButton(name: "Login", path: '/login'),
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: Text(
                      "or",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  HomeButton(name: "Register", path: '/register'),
                ],
              ),
            ),
            // TODO : lorsqu'il y a l'image, les buttons ne sont plus cliquables
            */
/*Image(
              alignment: Alignment.bottomCenter,
              fit: BoxFit.fitWidth,
              image: AssetImage("lib/assets/images/pokeball.jpg"),
            ),*//*

          ],
        ),
      ),
      bottomNavigationBar: const PokeNavBar(index: 4),
    );
  }
}
*/
