import 'package:flutter/material.dart';

import './src/home.dart';

import './src/blocs/cartProvider.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CartProvider(
      child: new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: new MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
