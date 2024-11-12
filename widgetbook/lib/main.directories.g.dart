// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _i1;
import 'package:widgetbook_workspace/widget_pokedex_box.dart' as _i2;
import 'package:widgetbook_workspace/widget_version_box.dart' as _i3;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'components',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'PokedexBox',
        useCase: _i1.WidgetbookUseCase(
          name: 'Pokedexbox',
          builder: _i2.buildPokedexBoxUseCase,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'VersionBox',
        useCase: _i1.WidgetbookUseCase(
          name: 'Versionbox',
          builder: _i3.buildVersionBoxUseCase,
        ),
      ),
    ],
  )
];
