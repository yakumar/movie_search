import 'package:flutter/material.dart';

import './blocs/cartProvider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController _searchController = new TextEditingController();



  @override
  Widget build(BuildContext context) {
    var bloc = CartProvider.of(context);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(10.0),
        child: new Center(
          child: new ListView(
            children: <Widget>[
              TextField(
                controller: _searchController,
                decoration: InputDecoration(labelText: 'Seach..'),
                onChanged: (val) {
                  bloc.startSearch(val);
                },
              ),
              StreamBuilder(
                  stream: bloc.searchStringControllerStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return FutureBuilder(
                        future: bloc.api.get(snapshot.data),
                        builder: (context, snapshoty) {
                          if (snapshoty.hasError) {
                            return Container(
                              child: Text('Error found'),
                            );
                          } else if (!snapshoty.hasData) {
                            return Container(
                              child: Text('No Movies found'),
                            );
                          } else {
                            print('${snapshoty.data[0].title}');
                            List listy = snapshoty.data;
                            return ListView.builder(
                              scrollDirection: Axis.vertical,

                              shrinkWrap: true,
                              itemCount: listy.length,
                              itemBuilder: (context, int index) {
                                return ListTile(
                                  title: Text('${listy[index].title}'),
                                  leading: CircleAvatar(
                                    child: Image.network(
                                        'https://image.tmdb.org/t/p/w92' +
                                                listy[index].posterPath ??
                                            ''),
                                  ),
                                  subtitle: Text('${listy[index].overview}'),
                                );
                              },
                            );
                          }
                        },
                      );
                    } else {
                      return Container(
                        child: Text('No data'),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
