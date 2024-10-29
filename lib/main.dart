import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke/config/router.dart';
import 'package:poke/config/theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return ProviderScope(
        child: MaterialApp.router(
      title: 'Pokédex',
      theme: ThemeConfig.createTheme(),
      routerConfig: ref.read(goRouterProvider)
    ));
  }
}