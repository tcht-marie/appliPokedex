import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/colors.dart';

class UserForm extends StatefulWidget {
  Function submit;
  List<Widget> children = [];

  UserForm({super.key, required this.submit, this.children = const []});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  String username = "";
  String password = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: PokedexColors.grayScale[100],
      child: Column(
        children: [
          const Image(
            alignment: Alignment.topCenter,
            image: AssetImage("lib/assets/images/banniere_pokemon.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          username = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a username';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        icon: Icon(
                            color: PokedexColors.identity,
                            Icons.person_outline),
                        label: const Text('Username'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          icon: Icon(
                              color: PokedexColors.identity,
                              Icons.password_outlined),
                          label: const Text('Password'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: ElevatedButton(
                        onPressed: () => widget.submit(
                            username, password, _formKey, context),
                        child: const Text("Submit"),
                      ),
                    ),
                    ...widget.children,
                  ],
                )),
          )
        ],
      ),
    );
  }
}
