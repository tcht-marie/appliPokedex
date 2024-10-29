
import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  final String titlePage;

  MyAppBar({super.key, required this.titlePage});

  Widget build(BuildContext context) {
   return AppBar(
     title: Text(
       titlePage,
       style: Theme.of(context).textTheme.headlineSmall,
     ),
   );
  }
}