import 'package:flutter/material.dart';
import 'package:sailor/sailor.dart';
import 'package:widgetpractice/Sailor.dart' as Rout;
import 'package:widgetpractice/CustomWidgets/RowButton.dart';

import '../Sailor.dart';

class HomePageArgs extends BaseArguments {
  final String text;

  HomePageArgs({this.text});
}

class MyHomePage extends StatefulWidget {
  final HomePageArgs args;

  MyHomePage({this.args});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.args.text),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomRowButton(
              key: Key('WidgetTestingEntry'),
              buttonText: 'Widget Testing',
              onClickFunction: () => Rout.Router.routeToWidgetPractice(),
            ),
            CustomRowButton(
              buttonText: 'Firebase Testing',
              onClickFunction: () => Rout.Router.routeToFirebasePractice(),
            ),
            CustomRowButton(
              key: Key('ProviderTestingEntry'),
              buttonText: 'Provider Practice',
              onClickFunction: () => Rout.Router.routeToProviderPractice(),
            ),
            CustomRowButton(
                buttonText: 'Advanced',
                onClickFunction: () {
                  Stack(children: [Container(child: Text('Yes'))]);
                  Rout.Router.routeToAdvanced();
                }),
          ],
        ),
      ),
    );
  }
}
