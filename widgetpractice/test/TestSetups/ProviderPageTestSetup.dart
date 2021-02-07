import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgetpractice/Providers/DummyTestProvider.dart';

class ProviderPageTestSetup {
  static Widget appWrapper(Widget widgetUnderTest) {
    return ChangeNotifierProvider<DummyTestProvider>(
        create: (_) => DummyTestProvider(),
        child: MaterialApp(home: widgetUnderTest));
  }
}
