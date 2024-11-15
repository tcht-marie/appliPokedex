import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'atoms/atoms_category.dart';
//import 'main.directories.g.dart';
import 'molecules/molecules_category.dart';
import 'organics/organics_category.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      addons: [
        DeviceFrameAddon(
            devices: [
              ...Devices.ios.all,
              ...Devices.android.all,
            ],
          initialDevice: Devices.ios.iPhone13,
        ),
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: ThemeData.light(),
            ),
            WidgetbookTheme(
              name: 'Dark',
              data: ThemeData.dark(),
            ),
          ],
        )
      ],
        directories: [
          //...directories,
          atomsCategory,
          moleculesCategory,
          organicsCategory,
      ],
    );
  }
}
