
import 'package:flutter_test/flutter_test.dart';
import 'package:poke/core/widget_keys.dart';

class MovesRobot {
  final WidgetTester tester;

  MovesRobot(this.tester);

  Future<void> goToMovesPage() async {
    final movesScreen = find.byKey(WidgetKeys.movesScreen);
    expect(movesScreen, findsOneWidget);
    await tester.tap(movesScreen);
    await tester.pump(const Duration(seconds: 3));
  }

  Future<void> tapToListMove(int move) async {
    final detailsMove = find.byKey(WidgetKeys.detailsMoves);
    expect(detailsMove, findsOneWidget);
    await tester.tap(detailsMove);
    await tester.pump(const Duration(seconds: 3));
  }
}