
import 'package:go_router/go_router.dart';
import 'package:poke/domain/services/authentication_service.dart';
import 'package:poke/views/items.dart';
import 'package:poke/views/moves.dart';
import 'package:poke/views/pokedex.dart';
import 'package:poke/views/pokemon.dart';
import 'package:poke/views/register_user.dart';

import '../views/versions.dart';

class GoRouterConfig {

  static GoRouter router() {

    return GoRouter (
      initialLocation: '/',
      routes: [
        GoRoute(
            path: '/',
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
            builder: (context, state) => PokemonComplete(pokemonId: state.pathParameters['id']!)
        ),
        GoRoute(
            path: '/register',
            builder: (context, state) => const RegisterUser("Marie", "test"))
      ],
    );
  }
}
