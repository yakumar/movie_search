import 'package:flutter/material.dart';
import 'formpage.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => new _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Bloc bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }


  @override
  Widget build(BuildContext context) {
    Bloc bloc = Provider.of(context);




   



    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Task List'),
        //backgroundColor: Colors.pink,
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.add), onPressed: (){Navigator.of(context).push(new MaterialPageRoute(
              builder: (context){
                return new FormPage();
              }));}),
        ],
      ),
      body: Center(
        child: new Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(10.0),
          child: new ListView.builder(
            itemCount: bloc.taskList.length,
              itemBuilder: (context, int index){

              return new ListTile(title: new Text(bloc.taskList[index].title), subtitle: new Text(bloc.taskList[index].subject),);
              }
          ),

    ),
      ),
    );
  }
}



