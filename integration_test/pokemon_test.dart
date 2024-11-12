
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:poke/components/pokedex_box.dart';
import 'package:poke/config/providers.dart';
import 'package:poke/main.dart';

import '../test/interceptor_test.dart';
import 'robots/pokemon_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late PokemonRobot pokemonRobot;

  testWidgets("Display Pokemon Details", (tester) async {
    Dio mockDio = Dio();
    pokemonRobot = PokemonRobot(tester);

    final mockPokemon = stubForTest({
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
              }
            ]
          '''
        }
      },
      "/pokemons/pokemon/1": {
        "GET": {
          "status": 200,
          "data": '''
            {
              "id": 1,
              "idLabel": "#0001",
              "name": "Bulbasaur",
              "weight": "6,9",
              "cries": "https://raw.githubusercontent.com/PokeAPI/cries/main/cries/pokemon/latest/1.ogg",
              "height": "0,7",
              "imageUrl": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
              "flavorText": "A strange seed was planted on its back at birth. The plant sprouts and grows with this POKéMON.",
              "pokemonTypes": [
                "GRASS",
                "POISON"
              ],
              "pokemonStat": [
                {
                  "baseStat": 45,
                  "statName": "HP"
                },
                {
                  "baseStat": 49,
                  "statName": "ATK"
                },
                {
                  "baseStat": 49,
                  "statName": "DEF"
                },
                {
                  "baseStat": 65,
                  "statName": "SATK"
                },
                {
                  "baseStat": 65,
                  "statName": "SDEF"
                },
                {
                  "baseStat": 45,
                  "statName": "SPD"
                }
              ],
              "abilities": [
                "Overgrow",
                "Chlorophyll"
              ],
              "evolutionChain": {
                "evolvesTo": {
                  "evolvesTo": [
                    {
                      "evolvesTo": [
                        {
                          "evolvesTo": [],
                          "pokemon": {
                            "id": 3,
                            "idLabel": "#0003",
                            "name": "Venusaur",
                            "imageUrl": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png"
                          }
                        }
                      ],
                      "pokemon": {
                        "id": 2,
                        "idLabel": "#0002",
                        "name": "Ivysaur",
                        "imageUrl": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png"
                      }
                    }
                  ],
                  "pokemon": {
                    "id": 1,
                    "idLabel": "#0001",
                    "name": "Bulbasaur",
                    "imageUrl": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png"
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
    await tester.pump(const Duration(seconds: 5));
    expect(find.byType(PokedexBox), findsNWidgets(1));
    await pokemonRobot.goToCompletePokemon();
    await tester.pumpAndSettle(const Duration(seconds: 3));
  });
}