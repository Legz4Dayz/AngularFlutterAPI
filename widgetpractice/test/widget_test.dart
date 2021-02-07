// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:widgetpractice/CustomWidgets/CustomList.dart';
import 'package:widgetpractice/CustomWidgets/RowButton.dart';
import 'package:widgetpractice/Providers/DummyTestProvider.dart';
import 'package:widgetpractice/Routes/ProviderPracticePage.dart';

import 'package:widgetpractice/main.dart';

void main() {
  testWidgets('MyApp test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    final widgetTestingEntry = find.byKey(Key('WidgetTestingEntry'));

    await tester.pumpAndSettle();

    expect(widgetTestingEntry, findsNWidgets(1));

    await tester.tap(widgetTestingEntry);

    await tester.pumpAndSettle();

    expect(find.byType(CustomList), findsOneWidget);
  });

  testWidgets('Provider Page Test', (WidgetTester tester) async {
    await tester.pumpWidget(TestSetup.appWrapper(ProviderPracticePage()));

    final dummyButton = find.byKey(Key('DummyButton'));

    expect(find.byType(Scaffold), findsOneWidget);

    expect(find.text('Test'), findsOneWidget);

    expect(find.text('Test'), findsOneWidget);

    await tester.tap(dummyButton);

    await tester.pumpAndSettle();

    expect(find.text('1'), findsOneWidget);
    expect(find.text('Test'), findsNothing);

    expect(find.byType(TextField), findsOneWidget);
  });

  testWidgets('Provider Page Text Test', (WidgetTester tester) async {
    await tester.pumpWidget(TestSetup.appWrapper(ProviderPracticePage()));

    String testText = 'TestText';

    // TestField cut = find.byType(TextField);
    TextField cut = tester.widget(find.byType(TextField));

    expect(find.byType(TextField), findsOneWidget);
    await tester.enterText(find.byType(TextField), testText);

    expect(cut.controller.value.text, equals(testText));

    cut.onSubmitted(cut.controller.value.text);

    expect(find.text(testText), findsOneWidget);

    expect(
        tester
            .state(find.byType(MaterialApp))
            .context
            .read<DummyTestProvider>()
            .testString,
        equals(testText));
  });
}

class TestSetup {
  static Widget appWrapper(Widget widgetUnderTest) {
    return ChangeNotifierProvider<DummyTestProvider>(
        create: (_) => DummyTestProvider(),
        child: MaterialApp(home: widgetUnderTest));
  }
}
