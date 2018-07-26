import 'package:flutter/material.dart';
import './screens/listpage.dart';
import './blocs/provider.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(

          primarySwatch: Colors.pink,
        ),
        home: new ListPage(),
      ),
    );
  }
}