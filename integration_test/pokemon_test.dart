
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:poke/config/providers.dart';
import 'package:poke/main.dart';
import 'package:poke/views/pokemon.dart';

import '../test/interceptor_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Display Pokemon Details", (tester) async {
    Dio mockDio = Dio();

    final mockPokemon = stubForTest({
      "/pokemons/pokemon/104": {
        "GET": {
          "status": 200,
          "data": '''
          {
            "id": 104,
            "idLabel": "#0104",
            "name": "Cubone",
            "weight": "6,5",
            "cries": "https://raw.githubusercontent.com/PokeAPI/cries/main/cries/pokemon/latest/104.ogg",
            "height": "0,4",
            "imageUrl": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/104.png",
            "flavorText": "Because it never removes its skull helmet, no one has ever seen this POKéMON's real face.",
            "pokemonTypes": [
              "GROUND"
            ],
            "pokemonStat": [
              {
                "baseStat": 50,
                "statName": "HP"
              },
              {
                "baseStat": 50,
                "statName": "ATK"
              },
              {
                "baseStat": 95,
                "statName": "DEF"
              },
              {
                "baseStat": 40,
                "statName": "SATK"
              },
              {
                "baseStat": 50,
                "statName": "SDEF"
              },
              {
                "baseStat": 35,
                "statName": "SPD"
              }
            ],
            "abilities": [
              "Rock-head",
              "Lightning-rod",
              "Battle-armor"
            ],
            "evolutionChain": {
              "evolvesTo": {
                "evolvesTo": [
                  {
                    "evolvesTo": [],
                    "pokemon": {
                      "id": 105,
                      "idLabel": "#0105",
                      "name": "Marowak",
                      "imageUrl": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/105.png"
                    }
                  }
                ],
                "pokemon": {
                  "id": 104,
                  "idLabel": "#0104",
                  "name": "Cubone",
                  "imageUrl": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/104.png"
                }
              }
            }
          }
          '''
        }
      }
    });
    mockDio.interceptors.add(mockPokemon);

    final container = ProviderContainer(overrides: [
      dioProvider.overrideWithValue(mockDio)
    ]);
    await tester.pumpWidget(UncontrolledProviderScope(container: container, child: const MyApp()));
    await tester.pump(const Duration(seconds: 3));
    expect(find.byType(PokemonComplete), findsOneWidget);
  });
}