import 'package:flutter/material.dart';

import './screens/login.dart';

import '../src/blocs/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Provider(
      child: new MaterialApp(
        home: new Login(),

      ),
    );

  }
}

