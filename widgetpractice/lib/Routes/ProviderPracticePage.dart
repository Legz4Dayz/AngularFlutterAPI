import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgetpractice/Providers/DummyTestProvider.dart';

class ProviderPracticePage extends StatelessWidget {
  const ProviderPracticePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = new TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: Text('Provider Practice'),
        ),
        body: Column(
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.text,
                  onSubmitted: (val) =>
                      {context.read<DummyTestProvider>().setTestString(val)},
                )),
            MaterialButton(
              child: Text('Submit'),
              onPressed: () {},
            ),
            Text(context.watch<DummyTestProvider>().testString),
            MaterialButton(
                key: Key('DummyButton'),
                child: Text('Press Me'),
                onPressed: () {
                  context.read<DummyTestProvider>().setTestString('1');
                }),
          ],
        ));
  }
}
