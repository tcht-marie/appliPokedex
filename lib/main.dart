import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke/config/router.dart';
import 'package:poke/config/theme.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  /// Ce widget est la racine de mon application
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
        child: MaterialApp.router(
            title: 'Pokédex',
            theme: ThemeConfig.createTheme(),
            routerConfig: ref.read(goRouterProvider)));
  }
}
