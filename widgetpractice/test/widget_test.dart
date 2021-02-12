// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
/*
  Reference
  https://flutter.institute/flutter-and-widget-tests
*/

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widgetpractice/CustomWidgets/CustomList.dart';
import 'package:widgetpractice/main.dart';

void main() {
  setUp(() {});

  testWidgets('MyApp test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    final widgetTestingEntry = find.byKey(Key('WidgetTestingEntry'));

    await tester.pumpAndSettle();

    expect(widgetTestingEntry, findsNWidgets(1));

    await tester.tap(widgetTestingEntry);

    await tester.pumpAndSettle();

    expect(find.byType(CustomList), findsOneWidget);
  });

  test('Test Test', () {
    expect(true, true);
  });

  test('Test Test', () {
    expect(true, true);
  });

  test('Test Test', () {
    expect(true, true);
  });
}
