import 'package:flutter/material.dart';
import 'package:poke/components/organisms/user_form.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'User form', type: UserForm)
Widget buildUserFormUseCase(BuildContext context) {
  return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [UserForm(submit: () {})]));
}
