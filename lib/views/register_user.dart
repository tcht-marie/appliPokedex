import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke/components/input_form.dart';
import 'package:poke/config/colors.dart';

class RegisterUser extends StatelessWidget {
  const RegisterUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        color: PokedexColors.grayScale[100],
        child: Form(
          child: Column(
            children: [
              const InputForm(text: 'Name', icons: Icons.person_outline),
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: InputForm(
                    text: 'Email',
                    icons: Icons.email_outlined,
                  )),
              const InputForm(text: 'Password', icons: Icons.password_outlined),
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: InputForm(
                      text: "Confirm Password",
                      icons: Icons.password_outlined)),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ActionChip(
                  backgroundColor: PokedexColors.identity,
                  padding: const EdgeInsets.all(15),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  side: const BorderSide(width: 0),
                  onPressed: () {},
                  label: Text(
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: PokedexColors.grayScale[100],
                          ),
                      'Submit'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
