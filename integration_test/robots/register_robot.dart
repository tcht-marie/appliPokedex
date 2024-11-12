
import 'package:flutter_test/flutter_test.dart';
import 'package:poke/core/widget_keys.dart';

class RegisterRobot {
  final WidgetTester tester;

  RegisterRobot(this.tester);

  Future<void> goToLoginPage() async {
    final loginScreen = find.byKey(WidgetKeys.loginScreen);
    expect(loginScreen, findsOneWidget);
    await tester.tap(loginScreen);
    await tester.pump(const Duration(seconds: 1));
  }

  Future<void> goToRegisterPage() async {
    final registerScreen = find.byKey(WidgetKeys.registerScreen);
    expect(registerScreen, findsOneWidget);
    await tester.tap(registerScreen);
    await tester.pump(const Duration(seconds: 1));
  }

  Future<void> enterUsername(String username) async {
    final loginUsername = find.byKey(WidgetKeys.loginUsername);
    expect(loginUsername, findsOneWidget);
    await tester.enterText(loginUsername, username);
    await tester.pump(const Duration(seconds: 3));
  }

  Future<void> enterPassword(String password) async {
    final loginPassword = find.byKey(WidgetKeys.loginPassword);
    expect(loginPassword, findsOneWidget);
    await tester.enterText(loginPassword, password);
    await tester.pump(const Duration(seconds: 3));
  }

  Future<void> tapRegisterButton() async {
    final loginButton = find.byKey(WidgetKeys.loginButton);
    expect(loginButton, findsOneWidget);
    await tester.tap(loginButton);
    await tester.pump(const Duration(seconds: 3));
  }
}