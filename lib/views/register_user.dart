import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:poke/components/user_form.dart';
import 'package:poke/config/providers.dart';

import '../components/poke_nav_bar.dart';

class RegisterUser extends ConsumerWidget {
  const RegisterUser({super.key});

  Future<void> _handleSubmit(username, password, formKey, context, ref) async {
    if (formKey.currentState!.validate()) {
      final authService = ref.read(authenticationServiceProvider);
      final isRegistered = await authService.register(username, password);

      if (isRegistered) {
        context.push('/login');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Registration failed. Please try again.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: UserForm(
          submit: (username, password, formKey, context) =>
              _handleSubmit(username, password, formKey, context, ref)),
      bottomNavigationBar: const PokeNavBar(index: 4),
    );
  }
}
