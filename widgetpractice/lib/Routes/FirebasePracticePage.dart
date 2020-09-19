import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebasePracticePage extends StatelessWidget {
  const FirebasePracticePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Firebase Practice')),
      body: Container(
          child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Test2').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Text('Loading');
          QueryDocumentSnapshot test = snapshot.data.documents[1];
          String x;
          test.data().forEach((key, value) {
            x = value;
          });
          return Text(x);
        },
      )),
    );
  }
}
