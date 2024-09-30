
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/input_form.dart';
import '../components/poke_nav_bar.dart';
import '../config/colors.dart';
import '../config/providers.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        color: PokedexColors.grayScale[100],
        child: Form(
          child: Column(
            children: [
              InputForm(
                text: 'Username',
                icons: Icons.person_outline,
                stateRegister: (inputUsername) {
                  setState(() {
                    username = inputUsername;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: InputForm(
                  text: 'Password',
                  icons: Icons.password_outlined,
                  stateRegister: (inputPassword) {
                    setState(() {
                      password = inputPassword;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ActionChip(
                  backgroundColor: PokedexColors.identity,
                  padding: const EdgeInsets.all(15),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  side: const BorderSide(width: 0),
                  onPressed: () {
                    ref.read(authenticationServiceProvider)
                        .login(username, password);
                  },
                  label: Text(
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: PokedexColors.grayScale[100],
                      ),
                      'Login'),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const PokeNavBar(index: 4),
    );
  }
}