import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgetpractice/Providers/StreamTest.dart';
import 'package:widgetpractice/Sailor.dart';

import 'Providers/StockProvider.dart';
import 'Routes/MyHomePage.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  Router.createRoutes();
  runApp(MyApp());
  Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<StockProvider>(create: (_) => StockProvider()),
          Provider<StreamTest>(create: (_) => StreamTest())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          onGenerateRoute: Router.sailor.generator(),
          navigatorKey: Router.sailor.navigatorKey,
          theme: ThemeData(
            backgroundColor: Colors.grey,
            scaffoldBackgroundColor: Colors.blueGrey,
            fontFamily: "Calibri",
            focusColor: Colors.red,
            // Theme.of(context).<insert color referring to>
            primaryColor: Colors.black,
            hintColor: Colors.red,
            buttonTheme: ButtonThemeData(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.red)),
                buttonColor: Colors.black,
                textTheme: ButtonTextTheme.primary),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MyHomePage(
            args: HomePageArgs(text: 'Widget Practice Home'),
          ),
        ));
  }
}
