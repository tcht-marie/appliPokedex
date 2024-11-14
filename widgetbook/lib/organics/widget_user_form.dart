

import 'package:flutter/cupertino.dart';
import 'package:poke/components/user_form.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'User form', type: UserForm)
Widget buildUserFormUseCase(BuildContext context) {
  return UserForm(submit: () {});
}