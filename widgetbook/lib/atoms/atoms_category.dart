import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_workspace/atoms/widget_linear_stat.dart';
import 'package:widgetbook_workspace/atoms/widget_list_item.dart';
import 'package:widgetbook_workspace/atoms/widget_logout.dart';
import 'package:widgetbook_workspace/atoms/widget_text_my_pokedex.dart';
import 'package:widgetbook_workspace/atoms/widget_type_chip.dart';

final atomsCategory = WidgetbookPackage(
  name: 'Atoms',
  children: [
    WidgetbookUseCase(
        name: 'Linear stat',
        builder: (context) => buildLinearStatUseCase(context)),
    WidgetbookUseCase(
        name: 'List item', builder: (context) => buildListIemUseCase(context)),
    WidgetbookUseCase(
        name: 'Logout', builder: (context) => buildLogoutUseCase(context)),
    WidgetbookUseCase(
        name: 'Text my pokedex',
        builder: (context) => buildTextMyPokedexUseCase(context)),
    WidgetbookUseCase(
        name: 'Type chip', builder: (context) => buildTypeChipUseCase(context)),
  ],
);
