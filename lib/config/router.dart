
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

// création d'un fournisseur pour la config du router
final goRouterProvider = Provider<GoRouter>((ref) {
  // récup du notifier d'authentification
  final notifier = ref.read(authenticationNotifierProvider.notifier);

  // création d'une instance de GoRouter
  return GoRouter(
    // écoute les changements d'états du notifier
    refreshListenable: notifier,
    // route initiale
    initialLocation: '/pokedex',
    // redirection basée sur l'état du user
    redirect: (context, state) {
      if (state.matchedLocation == "/mypokedex") {
        // si user connecté, pas de redirection
        if (notifier.isLoggedIn) {
          return null;
        } else {
          // sinon redirige vers la page de login
          return "/login";
        }
        // pas de redirection pour les autres routes
      } else {
        return null;
      }
    },
    // définition des routes
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
