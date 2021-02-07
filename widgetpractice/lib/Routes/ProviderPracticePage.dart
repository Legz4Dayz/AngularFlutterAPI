import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgetpractice/Providers/DummyTestProvider.dart';
import 'package:widgetpractice/Services/ProviderPageService.dart';

class ProviderPracticePage extends StatefulWidget {
  ProviderPracticePage({Key key, @required this.pageService}) : super(key: key);
  IProviderPageService pageService;

  @override
  _providerPracticePageState createState() => _providerPracticePageState();
}

class _providerPracticePageState extends State<ProviderPracticePage> {
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
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          content: Text(this.widget.pageService.returnMyName()),
                        ));
              },
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
