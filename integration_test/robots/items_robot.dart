
import 'package:flutter_test/flutter_test.dart';
import 'package:poke/core/widget_keys.dart';

class ItemsRobot {
  final WidgetTester tester;

  ItemsRobot(this.tester);

  Future<void> goToItemsPage() async {
    final itemsScreen = find.byKey(WidgetKeys.itemsScreen);
    expect(itemsScreen, findsOneWidget);
    await tester.tap(itemsScreen);
    await tester.pump(const Duration(seconds: 1));
  }

  Future<void> tapToListItem(int item) async {
    final detailsItem = find.byKey(WidgetKeys.detailsItem);
    expect(detailsItem, findsOneWidget);
    await tester.tap(detailsItem);
    await tester.pump(const Duration(seconds: 3));
  }
}