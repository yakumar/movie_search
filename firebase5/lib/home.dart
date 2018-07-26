import 'package:flutter/material.dart';
import './model/patient.dart';
import 'newHome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';



final FirebaseDatabase  database = FirebaseDatabase.instance;


class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {

  GlobalKey<FormState> formKeyState = GlobalKey<FormState>();

  Patient patient;

  List<Patient> patientList;

  DatabaseReference databaseReference;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    patient = Patient("", "", "", "", "", "");

    databaseReference = database.reference().child("new_firebase5");

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('New APP BAR!!'),
        backgroundColor: Colors.blueAccent,

      ),
      body: new Container(
        alignment: Alignment.center,
        child: new Center(
            child: new Form(
              key: formKeyState,
              child: ListView(
                padding: new EdgeInsets.all(10.0),
                children: <Widget>[
                  //name
                  new Padding(
                    padding: new EdgeInsets.all(18.0),
                    child: new TextFormField(
                      //initialValue: "",
                      decoration: new InputDecoration(labelText: "Type name"),
                      onSaved: (val)=> patient.name = val,
                      validator: (val) {
                        if(val.isEmpty){

                          return 'Please enter ur name';

                        }
                      },
                    ),
                    //age
                  ),

                  //sex
                  new Padding(
                    padding: new EdgeInsets.all(18.0),
                    child: new TextFormField(
                      initialValue: "",
                      decoration: new InputDecoration(labelText: "Type Sex"),
                      onSaved: (val)=> patient.sex = val,
                      validator: (val)=> val == "" ? val: null,
                    ),
                  ),
                  //chiefComplaint;

                  new Padding(
                    padding: new EdgeInsets.all(18.0),
                    child: new TextFormField(
                      keyboardType: TextInputType.multiline,

                      initialValue: "",
                      decoration: new InputDecoration(labelText: "Type Chief Complaint"),
                      onSaved: (val)=> patient.chiefComplaint = val,
                      validator: (val)=> val == "" ? val: null,
                    ),
                  ),
                  //  //  String diagnosis;
                  new Padding(
                    padding: new EdgeInsets.all(18.0),
                    child: new TextFormField(
                      keyboardType: TextInputType.multiline,
                      initialValue: "",
                      decoration: new InputDecoration(labelText: "Type Diagnosis"),
                      onSaved: (val)=> patient.diagnosis = val,
                      validator: (val)=> val == "" ? val: null,
                    ),
                  ),
                  //  //  String treatmentDone;
                  new Padding(
                    padding: new EdgeInsets.all(18.0),
                    child: new TextFormField(
                      keyboardType: TextInputType.multiline,
                      initialValue: "",
                      decoration: new InputDecoration(labelText: "Type Treatment done"),
                      onSaved: (val)=> patient.treatmentDone = val,
                      validator: (val)=> val == "" ? val: null,
                    ),
                  ),

                  //  String payment;
                  new Padding(
                    padding: new EdgeInsets.all(18.0),
                    child: new TextFormField(
                      initialValue: "",
                      decoration: new InputDecoration(labelText: "Type payment"),
                      onSaved: (val)=> patient.payment = val,
                      validator: (val)=> val == "" ? val: null,
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(18.0),
                    child: new TextFormField(
                      initialValue: "",
                      decoration: new InputDecoration(labelText: "Type something"),
                      onSaved: (val)=> patient.something = val,
                      validator: (val)=> val == "" ? val: null,
                    ),
                    //age
                  ),


                  new Padding(
                      padding: new EdgeInsets.all(18.0),
                      child: new RaisedButton(
                        onPressed: _onSubmit,
                        child: new Text('Save Patient'),
                      )
                  ),



                ],

              ),

            )

        ),
      ),
    );
  }

  void _onSubmit() {
    final FormState form = formKeyState.currentState;

    if (form.validate()){
      form.save();

      print(form);

      form.reset();

      print(" Name: ${patient.name}");
      print(" Age: ${patient.age}");
      print(" Something: ${patient.something}");


      databaseReference.push().set(patient.toJson());
      Navigator.of(context).pop();

    }


  }
}
