import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class DummyTestProvider extends ChangeNotifier {
  String testString = 'Test';

  void setTestString(String input) {
    this.testString = input;

    notifyListeners();
  }
}
