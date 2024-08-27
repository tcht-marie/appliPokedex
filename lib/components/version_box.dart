import 'package:flutter/material.dart';

class VersionBox extends StatelessWidget {
  const VersionBox({super.key, required this.name, required this.url});

  final String name;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Text(name, style: Theme.of(context).textTheme.bodySmall,),
      ),
      Expanded(
        child: Image.network(url, fit: BoxFit.scaleDown),
      )
    ]);
  }
}
