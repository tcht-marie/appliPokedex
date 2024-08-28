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
        child: Text(name, style: Theme
            .of(context)
            .textTheme
            .bodySmall,),
      ),
      Expanded(
        child: Image.network(
          url,
          fit: BoxFit.scaleDown,
          errorBuilder: (context, error, stackTrace) {
            return Image.network(
                "https://i.pinimg.com/originals/6d/e7/68/6de768dbd807a7cff7f67f554ad3647f.png",
                fit: BoxFit.scaleDown);
          },
        ),
      )
    ]);
  }
}
