import 'package:flutter/material.dart';
import 'screens/home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'New Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue

      ),
      home: new Home(),
    );
  }
}
