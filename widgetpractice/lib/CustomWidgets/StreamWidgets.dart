import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgetpractice/Providers/StreamTest.dart';

class StreamWidget extends StatefulWidget {
  @override
  _StreamWidget createState() => _StreamWidget();
}

class _StreamWidget extends State<StreamWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // controller.stream.listen((value){
  //   print('value From controller: $value')
  // });

  @override
  Widget build(BuildContext context) {
    var x = Provider.of<StreamTest>(context, listen: false);

    // StreamSubscription<double> streamSubscription = x.listen((value) {
    //   print('Value from controller: $value');
    // });

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: RaisedButton(
              onPressed: () {
                x.addToController();
              },
              child: Text('Test'),
            ),
          )
        ],
      ),
    );
  }
}
