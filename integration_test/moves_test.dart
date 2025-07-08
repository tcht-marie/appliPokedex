import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:poke/config/providers.dart';
import 'package:poke/core/widget_keys.dart';
import 'package:poke/main.dart';

import '../test/interceptor_test.dart';
import 'robots/moves_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late MovesRobot movesRobot;

  testWidgets("Display moves page", (tester) async {
    Dio mockDio = Dio();
    movesRobot = MovesRobot(tester);

    final mockMoves = stubForTest({
      "/pokemons": {
        "GET": {"status": 200, "data": "[]"}
      },
      "/pokemons/moves?limit=20&offset=0": {
        "GET": {
          "status": 200,
          "data": '''
            [
              {
                "name": "Drum-beating",
                "power": 80,
                "pp": 10,
                "pokemonTypes": "GRASS",
                "flavorText": "ドラムの　ねっこを　ドラミングで コントロールして　こうげき　することで あいての　すばやさを　さげる。",
                "pokemons": [
                  {
                    "id": 812,
                    "idLabel": "#0812",
                    "name": "Rillaboom",
                    "imageUrl": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/812.png"
                  }
                ]
              }
            ]
          '''
        }
      }
    });
    mockDio.interceptors.add(mockMoves);

    final container = ProviderContainer(overrides: [
      dioProvider.overrideWithValue(mockDio),
    ]);

    await tester.pumpWidget(
        UncontrolledProviderScope(container: container, child: const MyApp()));

    await movesRobot.goToMovesPage();
    expect(find.byKey(WidgetKeys.moves), findsOneWidget);
    await movesRobot.tapToListMove(1);
    expect(find.byKey(WidgetKeys.detailsMoves), findsAny);
    await tester.pumpAndSettle(const Duration(seconds: 5));
  });
}
