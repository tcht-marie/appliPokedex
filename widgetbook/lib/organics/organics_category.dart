import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_workspace/organics/widget_evo_species.dart';
import 'package:widgetbook_workspace/organics/widget_poke_nav_bar.dart';
import 'package:widgetbook_workspace/organics/widget_user_form.dart';

final organicsCategory = WidgetbookPackage(name: 'Organics', children: [
  WidgetbookUseCase(
      name: 'Evo species',
      builder: (context) => buildEvoSpeciesUseCase(context)),
  WidgetbookUseCase(
      name: 'Poke nav bar',
      builder: (context) => buildPokeNavBarUseCase(context)),
  WidgetbookUseCase(
      name: 'User form', builder: (context) => buildUserFormUseCase(context)),
]);
