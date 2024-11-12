
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:poke/config/providers.dart';
import 'package:poke/main.dart';

import '../test/interceptor_test.dart';
import 'robots/login_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late LoginRobot loginRobot;

  testWidgets("Successful Login", (tester) async {
    Dio mockDio = Dio();

    loginRobot = LoginRobot(tester);

    final mockPokedex = stubForTest({
      "/pokemons": {
        "GET": {
          "status": 200,
          "data": "[]"
        }
      },
      "/auth/login": {
        "POST": {
          "status": 200,
          "data": '{}'
        }
      },
      "/pokemons/pokedex/me": {
        "GET": {
          "status": 200,
          "data": "[]"
        }
      }
    });

    mockDio.interceptors.add(mockPokedex);

    final container = ProviderContainer(overrides: [
      dioProvider.overrideWithValue(mockDio),
    ]);

    await tester.pumpWidget(UncontrolledProviderScope(container: container, child: const MyApp()));

    await loginRobot.goToLoginPage();
    await loginRobot.enterUsername('Marie');
    await loginRobot.enterPassword('test');
    await loginRobot.tapLoginButton();
    await loginRobot.verifyUserEmptyPokedex();
    await loginRobot.tapLogoutButton();

    await tester.pumpAndSettle();
  });

  testWidgets("Failed Login", (tester) async {
    Dio mockDio = Dio();

    loginRobot = LoginRobot(tester);

    final mockPokedex = stubForTest({
      "/pokemons": {
        "GET": {
          "status": 200,
          "data": "[]"
        }
      },
      "/auth/login": {
        "POST": {
          "status": 403,
          "data": '{}'
        }
      }
    });

    mockDio.interceptors.add(mockPokedex);

    final container = ProviderContainer(overrides: [
      dioProvider.overrideWithValue(mockDio),
    ]);

    await tester.pumpWidget(UncontrolledProviderScope(container: container, child: const MyApp()));

    await loginRobot.goToLoginPage();
    await loginRobot.enterUsername('Marie');
    await loginRobot.enterPassword('test');
    await loginRobot.tapLoginButton();
    await loginRobot.verifyError();

    await tester.pumpAndSettle();
  });
}