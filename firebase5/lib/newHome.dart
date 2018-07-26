import 'package:flutter/material.dart';
import './model/patient.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';



final FirebaseDatabase  database = FirebaseDatabase.instance;


class NewHome extends StatefulWidget {
  @override
  _NewHomeState createState() => new _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
  
  List<Patient> patientList = List<Patient>();
  
  DatabaseReference databaseReference;
  
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    databaseReference = database.reference().child("new_firebase5");
    
    databaseReference.onChildAdded.listen(_onEntryAdded);
    
    
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('New APP BAR!!'),
        backgroundColor: Colors.blueAccent,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.add), onPressed: ()=> Navigator.of(context).pushNamed('/home')),

        ],
      ),
      body: new Container(
        alignment: Alignment.center,
        padding: new EdgeInsets.all(10.0),
        child: new Column(
          children:<Widget>[ new Flexible(
            child: new FirebaseAnimatedList(
              query: databaseReference.orderByChild('dateTime'),
              itemBuilder: (_, DataSnapshot snapshot, Animation<double> animation, int index){
                return new Card(
                  child: ListTile(leading: new CircleAvatar(backgroundColor: Colors.red,), title: new Text(patientList[index].name),
                  subtitle: new Text(patientList[index].diagnosis),
                    trailing: new Text(patientList[index].payment),
                  
                  ),
                );


              },


            ),

          ),
          ]
        ),
      ),
    );
  }

  void _onEntryAdded(Event event) {
    
    setState(() {
      patientList.add(Patient.fromSnapshot(event.snapshot));
    });
  }
}
