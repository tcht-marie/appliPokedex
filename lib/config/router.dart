
import 'package:go_router/go_router.dart';
import 'package:poke/views/items.dart';
import 'package:poke/views/moves.dart';
import 'package:poke/views/pokedex.dart';
import 'package:poke/views/pokemon.dart';
import 'package:poke/views/register_user.dart';

import '../views/versions.dart';

class GoRouterConfig {

  static GoRouter router(pokemonService) {
    return GoRouter (
      initialLocation: '/',
      routes: [
        GoRoute(
            path: '/',
            builder: (context, state) => Pokedex(pokemonService: pokemonService)
        ),
        GoRoute(
            path: '/versions',
            builder: (context, state) => Versions(pokemonService: pokemonService)
        ),
        GoRoute(
            path: '/items',
            builder: (context, state) => Items(pokemonService: pokemonService)
        ),
        GoRoute(
            path: '/moves',
            builder: (context, state) => Moves(pokemonService: pokemonService)
        ),
        GoRoute(
            path: '/pokemon/:id',
            builder: (context, state) => PokemonComplete(pokemonService: pokemonService, pokemonId: state.pathParameters['id']!)
        ),
        GoRoute(
            path: '/register',
          builder: (context, state) => const RegisterUser()
        )
      ],
    );
  }
}
