import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:poke/config/providers.dart';

import '../components/poke_nav_bar.dart';
import '../components/user_form.dart';

class Login extends ConsumerWidget {
  const Login({super.key});

  Future<void> _handleSubmit(username, password, formKey, context, ref) async {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      final authNotifier = ref.read(authenticationNotifierProvider.notifier);
      final isAuthenticated = await authNotifier.login(username, password);

      if (isAuthenticated) {
        GoRouter.of(context).go('/mypokedex');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login failed. Please try again.')));
      }
    }
  }

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: UserForm(
        submit: (username, password, formKey, context) =>
            _handleSubmit(username, password, formKey, context, ref),
        children: [
          GestureDetector(
            onTap: () => context.push("/register"),
            child: const Text(
                "Don't have an account yet ? Click here to register."),
          )
        ],
      ),
      bottomNavigationBar: const PokeNavBar(index: 4),
    );
  }
}
