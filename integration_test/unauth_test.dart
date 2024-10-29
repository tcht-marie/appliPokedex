
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:poke/config/providers.dart';
import 'package:poke/main.dart';

import '../test/interceptor_test.dart';
import '../test/mock.mocks.dart';
import 'robots/login_robot.dart';

/* dart run build_runner build */

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late LoginRobot loginRobot;

  testWidgets("Login", (tester) async {
    Dio mockDio = Dio();
    final container = ProviderContainer(overrides: [
      dioProvider.overrideWithValue(mockDio),
    ]);

    await tester.pumpWidget(UncontrolledProviderScope(container: container, child: const MyApp()));

    loginRobot = LoginRobot(tester);

    final mockPokedex = stubForTest({
      "http://localhost:8080/pokemons": {
        "GET": {
          "status": 200,
          "data": "[]"
        }
      }
    });

    final mockLogin = stubForTest({
      "http://localhost:8080/auth/login": {
        "POST": {
          "status": 200
        }
      }
    });

    /*final mockPokedexUser = stubForTest({
      "/pokemons/pokedex/me": {
        "GET": {
          "status": 200,
          "data": "[]"
        }
      }
    });*/
    mockDio.interceptors.addAll([mockPokedex, mockLogin]);

    await loginRobot.goToLoginPage();
    await loginRobot.enterUsername('Marie');
    await loginRobot.enterPassword('test');
    await loginRobot.tapLoginButton();
    //await loginRobot.verifyUserEmptyPokedex();

    await tester.pumpAndSettle();
  });
}

/* REGISTER
loginRobot.verifyError();*/