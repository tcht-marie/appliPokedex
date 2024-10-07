import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:poke/config/providers.dart';

class Logout extends ConsumerWidget {
  const Logout({super.key});

  Future<void> _handleSubmit(formKey, context, ref) async {
    if (formKey.currentState!.validate()) {
      final authNotifier = ref.read(authenticationNotifierProvider);
      final isLogout = await authNotifier.logout();

      if (isLogout) {
        GoRouter.of(context).push('/login');
      }
    }
  }

  @override
  Widget build(BuildContext context, ref) {
    return FloatingActionButton(
        onPressed: () => {_handleSubmit(null, context, ref)},
      child: const Icon(Icons.logout_outlined),
    );
  }
}
