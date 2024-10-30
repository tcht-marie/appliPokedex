
import 'package:flutter_test/flutter_test.dart';
import 'package:poke/core/widget_keys.dart';

class LoginRobot {
  final WidgetTester tester;

  LoginRobot(this.tester);

  Future<void> goToLoginPage() async {
    final loginScreen = find.byKey(WidgetKeys.loginScreen);
    expect(loginScreen, findsOneWidget);
    await tester.tap(loginScreen);
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

  Future<void> tapLoginButton() async {
    final loginButton = find.byKey(WidgetKeys.loginButton);
    expect(loginButton, findsOneWidget);
    await tester.tap(loginButton);
    await tester.pump(const Duration(seconds: 3));
  }

  Future<void> verifyUserEmptyPokedex() async {
    final userPokedexEmpty = find.byKey(WidgetKeys.userPokedexEmpty);
    expect(userPokedexEmpty, findsOneWidget);
    await tester.pump(const Duration(seconds: 5));
  }

  Future<void> verifyError() async {
    final errorSnackBar = find.byKey(WidgetKeys.loginErrorSnackBar);
    expect(errorSnackBar, findsOneWidget);
    await tester.pump(const Duration(seconds: 1));
  }
}


/* REGISTER
  void verifyError() {
    final errorSnackBar = find.byKey(WidgetKeys.loginErrorSnackBar);
    expect(errorSnackBar, findsOneWidget);
  }*/