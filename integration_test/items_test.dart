
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:poke/components/list_item.dart';
import 'package:poke/config/providers.dart';
import 'package:poke/core/widget_keys.dart';
import 'package:poke/main.dart';
import 'package:poke/views/items.dart';

import '../test/interceptor_test.dart';
import 'robots/items_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late ItemsRobot itemsRobot;

  testWidgets("Display Items page", (tester) async {
    Dio mockDio = Dio();
    itemsRobot = ItemsRobot(tester);

    final mockItems = stubForTest({
      "/pokemons/items": {
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
              },
              {
                "spriteUrl": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/ultra-ball.png",
                "name": "Ultra-ball",
                "id": 2,
                "effect": "Tries to catch a wild Pokémon.  Success rate is 2×.",
                "category": "standard-balls"
              },
              {
                "spriteUrl": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/great-ball.png",
                "name": "Great-ball",
                "id": 3,
                "effect": "Tries to catch a wild Pokémon.  Success rate is 1.5×.",
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
    await tester.pump(const Duration(seconds: 5));
    expect(find.byKey(WidgetKeys.detailsItem), findsNWidgets(3));
    /*await itemsRobot.tapToListItem();
    await tester.pump(const Duration(seconds: 5));
    expect(find.byType(ListItem), findsNWidgets(3));*/

    await tester.pumpAndSettle();
  });
}