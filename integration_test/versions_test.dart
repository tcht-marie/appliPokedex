
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:poke/components/version_box.dart';
import 'package:poke/config/providers.dart';
import 'package:poke/main.dart';

import '../test/interceptor_test.dart';
import 'robots/versions_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late VersionsRobot versionsRobot;

  testWidgets("Display Versions page", (tester) async {
    Dio mockDio = Dio();
    versionsRobot = VersionsRobot(tester);

    final mockVersions = stubForTest({
      "/pokemons/versions": {
        "GET": {
          "status": 200,
          "data": '''
            [
              {
                "name": "Red",
                "url": "https://img.pokemondb.net/boxes/lg/red-large.jpg"
              },
              {
                "name": "Blue",
                "url": "https://img.pokemondb.net/boxes/lg/blue-large.jpg"
              },
              {
                "name": "Yellow",
                "url": "https://img.pokemondb.net/boxes/lg/yellow-large.jpg"
              },
              {
                "name": "Gold",
                "url": "https://img.pokemondb.net/boxes/lg/gold-large.jpg"
              }
            ]
          '''
        }
      }
    });
    mockDio.interceptors.add(mockVersions);

    final container = ProviderContainer(overrides: [
      dioProvider.overrideWithValue(mockDio),
    ]);

    await tester.pumpWidget(
        UncontrolledProviderScope(container: container, child: const MyApp()));

    await versionsRobot.goToVersionsPage();
    //expect(find.byType(VersionBox), findsNWidgets(4));
    //await tester.pump(const Duration(seconds: 5));
    await tester.pumpAndSettle(const Duration(seconds: 5));
  });
}