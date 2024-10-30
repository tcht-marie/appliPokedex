
import 'package:flutter_test/flutter_test.dart';
import 'package:poke/core/widget_keys.dart';

class VersionsRobot {
  final WidgetTester tester;

  VersionsRobot(this.tester);

  Future<void> goToVersionsPage() async {
    final versionsScreen = find.byKey(WidgetKeys.versionsScreen);
    expect(versionsScreen, findsOneWidget);
    await tester.tap(versionsScreen);
    await tester.pump(const Duration(seconds: 3));
  }
}