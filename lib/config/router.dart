
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:poke/config/providers.dart';
import 'package:poke/views/items.dart';
import 'package:poke/views/moves.dart';
import 'package:poke/views/my_pokedex.dart';
import 'package:poke/views/pokedex.dart';
import 'package:poke/views/pokemon.dart';
import 'package:poke/views/register_user.dart';

import '../views/login.dart';
import '../views/versions.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final notifier = ref.read(authenticationNotifierProvider.notifier);
  return GoRouter(
    refreshListenable: notifier,
    initialLocation: '/pokedex',
    redirect: (context, state) {
      if (state.matchedLocation == "/mypokedex") {
        if (notifier.isLoggedIn) {
          return null;
        } else {
          return "/login";
        }
      } else {
        return null;
      }
    },
    routes: [
      GoRoute(path: '/pokedex', builder: (context, state) => const Pokedex()),
      GoRoute(path: '/versions', builder: (context, state) => const Versions()),
      GoRoute(path: '/items', builder: (context, state) => const Items()),
      GoRoute(path: '/moves', builder: (context, state) => const Moves()),
      GoRoute(
          path: '/pokemon/:id',
          builder: (context, state) =>
              PokemonComplete(pokemonId: state.pathParameters['id']!)),
      GoRoute(
          path: '/register', builder: (context, state) => const RegisterUser()),
      GoRoute(path: '/login', builder: (context, state) => const Login()),
      GoRoute(path: '/mypokedex', builder: (context, state) => const MyPokedex()),
    ],
  );
});
