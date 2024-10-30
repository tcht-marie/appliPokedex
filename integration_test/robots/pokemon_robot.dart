
import 'package:flutter_test/flutter_test.dart';
import 'package:poke/core/widget_keys.dart';

class PokemonRobot {
  final WidgetTester tester;
  PokemonRobot(this.tester);

  Future<void> goToCompletePokemon() async {
    final completePokemon = find.byKey(WidgetKeys.completePokemon);
    expect(completePokemon, findsOneWidget);
    await tester.tap(completePokemon);
    await tester.pump(const Duration(seconds: 3));
  }
}