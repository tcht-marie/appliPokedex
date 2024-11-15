
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke/components/logout.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Logout', type: Logout)
Widget buildLogoutUseCase(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.black12,
      actions: const [
        Logout(),
      ],
    ),
  );
}