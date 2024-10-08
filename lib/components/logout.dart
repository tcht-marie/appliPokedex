import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:poke/config/providers.dart';

import '../config/colors.dart';


class Logout extends ConsumerWidget {
  const Logout({super.key});

  Future<void> _handleSubmit(BuildContext context, WidgetRef ref) async {
    final authNotifier = ref.read(authenticationNotifierProvider.notifier);
    final isLogout = await authNotifier.logout();
    if (isLogout) {
      GoRouter.of(context).push('/mypokedex');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      backgroundColor: PokedexColors.identity,
      onPressed: () => _handleSubmit(context, ref),
      child: Icon(
          Icons.logout_outlined,
        color: PokedexColors.grayScale[100],
      ),
    );
  }
}