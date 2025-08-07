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

/// Provider pour la configuration du router
/// Injection du notifier d'authentification
/// Et retourne une instance de GoRouter
final goRouterProvider = Provider<GoRouter>((ref) {
  final notifier = ref.read(authenticationNotifierProvider.notifier);

  return GoRouter(
    // écoute les changements d'états du notifier
    refreshListenable: notifier,
    initialLocation: '/pokedex',
    // redirection basée sur l'état du user
    redirect: (context, state) {
      if (state.matchedLocation == "/mypokedex") {
        if (notifier.isLoggedIn) {
          return null; // si user connecté, pas de redirection
        } else {
          return "/login"; // sinon redirige vers la page de login
        }
      } else {
        return null; // pas de redirection pour les autres routes
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
      GoRoute(
          path: '/mypokedex', builder: (context, state) => const MyPokedex()),
    ],
  );
});
