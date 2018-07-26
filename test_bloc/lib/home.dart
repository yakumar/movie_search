
import 'package:flutter/material.dart';
import 'dart:async';
import 'bloc/blocs.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  void _incrementCounter() {

    bloc.consumingCSink(1);



  }



  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(

        title: new Text(widget.title),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.add), onPressed: _holaIncrement)
        ],
      ),
      body: new Center(

        child: new Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new StreamBuilder(

              initialData: 0,
              stream: bloc.finalStreamCStream,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot){
                return Text('${snapshot.data}');
              },

            ),

          ],
        ),
      ),

      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _holaIncrement() {

    bloc.consumingCSink(2);
  }
}
