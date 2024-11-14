import 'package:flutter/cupertino.dart';
import 'package:poke/components/version_box.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// l'image ne s'affichera pas sauf config particulière et changement dans mon composant version_box
@widgetbook.UseCase(name: 'Versionbox', type: VersionBox)
Widget buildVersionBoxUseCase(BuildContext context) {
  String name = context.knobs.string(label: 'name', initialValue: 'red');
  return GridView(
    gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    children: [
      VersionBox(
          name: name,
          url: 'https://img.pokemondb.net/boxes/lg/$name-large.jpg'
      ),
    ],
  );
}
