import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final String labelText;
  final String hintText;
  final Function(String) searchOutput;

  CustomSearchBar({Key key, this.labelText, this.hintText, this.searchOutput});
  @override
  _CustomSearchBar createState() => _CustomSearchBar();
}

class _CustomSearchBar extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (value) {
          widget.searchOutput(value);
        },
        decoration: InputDecoration(
            labelText: widget.labelText,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Theme.of(context).accentColor),
            labelStyle: TextStyle(color: Colors.black),
            fillColor: Theme.of(context).buttonColor,
            filled: true,
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)))),
      ),
    );
  }
}
