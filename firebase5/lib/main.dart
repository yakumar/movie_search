import 'package:flutter/material.dart';
import './model/patient.dart';
import 'newHome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'home.dart';


final FirebaseDatabase  database = FirebaseDatabase.instance;

void main() {
  runApp(new MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new NewHome(),
      routes: <String, WidgetBuilder>{
        '/newHome': (BuildContext context) => new NewHome(),
        '/home': (BuildContext context) => new Home(),
      },
    );
  }
}

