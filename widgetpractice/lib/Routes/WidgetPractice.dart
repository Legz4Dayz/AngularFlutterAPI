import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widgetpractice/CustomWidgets/CustomList.dart';

class WidgetPracticePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Widget Practice')),
      body: CustomList(),
    );
  }
}
