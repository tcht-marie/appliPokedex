
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:poke/config/providers.dart';
import 'package:poke/core/widget_keys.dart';
import 'package:poke/main.dart';

import '../test/interceptor_test.dart';
import 'robots/items_robot.dart';

// TODO : problème
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late ItemsRobot itemsRobot;

  testWidgets("Display Items page", (tester) async {
    Dio mockDio = Dio();
    itemsRobot = ItemsRobot(tester);

    final mockItems = stubForTest({
      "/pokemons": {
        "GET": {"status": 200, "data": "[]"}
      },
      "/pokemons/items?limit=20&offset=0": {
        "GET": {
          "status": 200,
          "data": '''
            [
              {
                "spriteUrl": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/master-ball.png",
                "name": "Master-ball",
                "id": 1,
                "effect": "Catches a wild Pokémon every time.",
                "category": "standard-balls"
              }
            ]
          '''
        }
      }
    });
    mockDio.interceptors.add(mockItems);

    final container = ProviderContainer(overrides: [
      dioProvider.overrideWithValue(mockDio),
    ]);

    await tester.pumpWidget(
        UncontrolledProviderScope(container: container, child: const MyApp()));

    await itemsRobot.goToItemsPage();
    expect(find.byKey(WidgetKeys.items), findsOneWidget);
    await itemsRobot.tapToListItem(1);
    expect(find.byKey(WidgetKeys.detailsItem), findsAny);

    await tester.pumpAndSettle(const Duration(seconds: 5));
  });
}