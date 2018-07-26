import 'package:flutter/material.dart';
import './screens/newsList.dart';
import 'blocs/stories_provider.dart';



class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: new MaterialApp(
        title: 'News APP',

        home: new NewsList(),

      ),
    );
  }
}


