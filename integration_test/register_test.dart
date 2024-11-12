
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:poke/config/providers.dart';
import 'package:poke/main.dart';

import '../test/interceptor_test.dart';
import 'robots/register_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late RegisterRobot registerRobot;

  testWidgets("Register test", (tester) async {
    Dio mockDio = Dio();
    registerRobot = RegisterRobot(tester);

    final mockRegister = stubForTest({
      "/pokemons": {
        "GET": {
          "status": 200,
          "data": "[]"
        }
      },
      "/auth/register": {
        "POST": {
          "status": 200,
          "data": '{}'
        }
      }
    });
    mockDio.interceptors.add(mockRegister);

    final container = ProviderContainer(overrides: [
      dioProvider.overrideWithValue(mockDio),
    ]);

    await tester.pumpWidget(UncontrolledProviderScope(container: container, child: const MyApp()));

    await registerRobot.goToLoginPage();
    await registerRobot.goToRegisterPage();
    await registerRobot.enterUsername('Marie');
    await registerRobot.enterPassword('test');
    await registerRobot.tapRegisterButton();
    await tester.pumpAndSettle();
  });

}