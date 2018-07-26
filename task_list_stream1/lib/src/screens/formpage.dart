import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import 'listpage.dart';
import '../blocs/provider.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => new _FormPageState();
}

class _FormPageState extends State<FormPage> {

  Task task = new Task(title: '', subject: '');


  String myTitle = "";
  String mySubject = "";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(context);


  }

  @override
  Widget build(BuildContext context) {

    Bloc bloc = Provider.of(context);
    return new Scaffold(

      appBar: new AppBar(
        title: new Text('New Form'),
      ),
      body: new Container(
        margin: EdgeInsets.all(18.0),
        padding: EdgeInsets.all(18.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            getTitle(bloc),
            getSubject(bloc),
            Container(height: 18.0,),
            RaisedButton(onPressed: (){
              setState(() {
                bloc.taskList.add(task);


              });



              Navigator.of(context).pop();
              }, child: new Text('Submit'), color: Theme.of(context).primaryColor,),
          ],
        )
      ),
    );
  }

 Widget getTitle(Bloc bloc) {

    return TextField(
      onChanged: (val){
        setState(() {
          //newStringList.add(val);
          task.title = val;

        });
        },
      decoration: InputDecoration(
          labelText: 'Enter Task title'
      ),
    );
 }

  Widget getSubject(Bloc bloc) {
    return TextField(
      onChanged: (val){
        setState(() {
          task.subject = val;
        });
      },
      decoration: InputDecoration(
          labelText: 'Enter Task Subject'
      ),
    );
  }
}
