import 'package:flutter/material.dart';
import 'CustomSearchBar.dart';

class CustomList extends StatefulWidget {
  @override
  _CustomListState createState() => _CustomListState();
}

class _CustomListState extends State<CustomList> {
  Future<List<String>> getTest;
  String filter;

  @override
  void initState() {
    getTest = getList();
    super.initState();
    filter = "";
  }

  Future<List<String>> getList() async {
    List<String> result = [
      "Yes",
      "Wait",
      "Worked",
      "I guess",
      "Hopefully",
      "lawl",
      "F",
      "ftest",
      "fAlso"
    ];
    return Future.delayed(Duration(seconds: 5)).then((value) => result);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      CustomSearchBar(
          hintText: 'Filter by letters',
          labelText: 'Person Search',
          searchOutput: (String value) {
            print(value);
            setState(() {
              filter = value;
            });
          }),
      FutureBuilder<List<String>>(
        future: getTest,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Container(
                  child: Expanded(
                      child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Center(child: CircularProgressIndicator())],
              )));
            case ConnectionState.done:
              {
                List<String> test = snapshot.data;
                test = test
                    .where((element) =>
                        element.toLowerCase().contains(filter.toLowerCase()))
                    .toList();
                return Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: test.length,
                        itemBuilder: (context, index) {
                          return Card(
                              child: ListTile(
                            title: Text(test[index]),
                            onTap: () => print(index),
                          ));
                        }));
              }
            default:
              return Container(
                  child: Expanded(
                      child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Center(child: CircularProgressIndicator())],
              )));
          }
        },
      )
    ]));
  }
}
