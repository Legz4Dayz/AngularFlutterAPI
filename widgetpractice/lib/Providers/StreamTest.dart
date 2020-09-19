import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StreamTest with ChangeNotifier {
  StreamController controller = new StreamController(
    onPause: () => print('Yas'),
  );

  StreamSubscription subscription;

  StreamTest() {
    subscription = controller.stream.listen((event) {
      print(event);
    });
  }

  void addToController() {
    controller.add("Yes");
  }
}
