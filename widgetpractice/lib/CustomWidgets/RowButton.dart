import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRowButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onClickFunction;
  final Key key;

  CustomRowButton(
      {@required this.buttonText, @required this.onClickFunction, this.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          child: Text(buttonText),
          onPressed: onClickFunction,
        ));
  }
}
