import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widgetpractice/Providers/DummyTestProvider.dart';
import 'package:widgetpractice/Routes/ProviderPracticePage.dart';
import 'package:provider/provider.dart';

import 'package:widgetpractice/Services/ProviderPageService.dart';

import '../TestSetups/ProviderPageTestSetup.dart';

void main() {
  setUp(() {});
  group('Provider Page', () {
    setUp(() {});

    testWidgets('Provider Page Test', (WidgetTester tester) async {
      await tester.pumpWidget(ProviderPageTestSetup.appWrapper(
          ProviderPracticePage(pageService: ProviderPageService())));

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
      await tester
          .pumpWidget(ProviderPageTestSetup.appWrapper(ProviderPracticePage(
        pageService: ProviderPageService(),
      )));

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

    testWidgets('Provider Page Alert Test', (WidgetTester tester) async {
      await tester.pumpWidget(ProviderPageTestSetup.appWrapper(
          ProviderPracticePage(pageService: ProviderPageService())));

      await tester.tap(find.text('Submit'));

      expect(find.text('Submit'), findsOneWidget);

      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);

      await tester.tapAt(Offset(20, 20));

      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsNothing);
    });
  });
}
