import 'dart:nativewrappers/_internal/vm/lib/mirrors_patch.dart';

import 'package:go_router/go_router.dart';
import 'package:poke/config/providers.dart';
import 'package:poke/views/items.dart';
import 'package:poke/views/moves.dart';
import 'package:poke/views/pokedex.dart';
import 'package:poke/views/pokemon.dart';
import 'package:poke/views/register_user.dart';

import '../views/login.dart';
import '../views/versions.dart';

class GoRouterConfig {
  static GoRouter router(ref) {
    final notifier = ref.read(authenticationNotifierProvider.notifier);
    return GoRouter(
      refreshListenable: notifier,
      initialLocation: '/login',
      redirect: (context, state) => {
        if (state.matchedLocation == "/home") {
          if (ref.read(authenticationServiceProvider))
        }
      },
      routes: [
        GoRoute(
            path: '/pokedex',
            builder: (context, state) => const Pokedex()
        ),
        GoRoute(
            path: '/versions',
            builder: (context, state) => const Versions()
        ),
        GoRoute(
            path: '/items',
            builder: (context, state) => const Items()
        ),
        GoRoute(
            path: '/moves',
            builder: (context, state) => const Moves()
        ),
        GoRoute(
            path: '/pokemon/:id',
            builder: (context, state) =>
                PokemonComplete(pokemonId: state.pathParameters['id']!)
        ),
        GoRoute(
            path: '/register',
            builder: (context, state) => const RegisterUser()
        ),
        GoRoute(
            path: '/login',
            builder: (context, state) => const Login()
        ),
      ],
    );
  }
}
