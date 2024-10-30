import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:poke/components/pokedex_box.dart';
import 'package:poke/config/providers.dart';
import 'package:poke/main.dart';

import '../test/interceptor_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Display Pokedex page", (tester) async {
    Dio mockDio = Dio();

    final mockPokedex = stubForTest({
      "/pokemons": {
        "GET": {
          "status": 200,
          "data": '''
            [
              {
                  "id": 1,
                  "idLabel": "#0001",
                  "name": "Bulbasaur",
                  "imageUrl": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png"
              },
              {
                  "id": 2,
                  "idLabel": "#0002",
                  "name": "Ivysaur",
                  "imageUrl": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png"
              },
              {
                  "id": 3,
                  "idLabel": "#0003",
                  "name": "Venusaur",
                  "imageUrl": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png"
              }
            ]
          '''
        }
      }
    });
    mockDio.interceptors.add(mockPokedex);

    final container = ProviderContainer(overrides: [
      dioProvider.overrideWithValue(mockDio),
    ]);

    await tester.pumpWidget(
        UncontrolledProviderScope(container: container, child: const MyApp()));

    await tester.pump(const Duration(seconds: 5));
    expect(find.byType(PokedexBox), findsNWidgets(3));
  });
}
