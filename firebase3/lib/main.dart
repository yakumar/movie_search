import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './model/Board.dart';

final FirebaseDatabase database = FirebaseDatabase.instance;


final FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = new GoogleSignIn();

void main() {
  runApp(new MaterialApp(
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  List<Board> boardMessages = List();

  Board board;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  DatabaseReference databaseReference;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    board = Board("", "");

    databaseReference = database.reference().child("community_board");

    databaseReference.onChildAdded.listen(_onEntryAdded);
    databaseReference.onChildChanged.listen(_onEntryChanged);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Community Board'),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: new Container(
        alignment: Alignment.center,
        child: new Center(
          child: new Column(
            children: <Widget>[
              Padding(
                padding: new EdgeInsets.all(18.0),
                child: new RaisedButton(onPressed: () => _gSignIn(), child: new Text('Google Sign in'),),
              ),
              Padding(
                padding: new EdgeInsets.all(18.0),
                child: new RaisedButton(onPressed: ()=> _signIn(), child: new Text('Sign In with Email'),),
              ),
              Padding(
                padding: new EdgeInsets.all(18.0),
                child: new RaisedButton(onPressed: ()=> _createUser(), child: new Text('Sign UP'),),
              ),
              Padding(
                padding: new EdgeInsets.all(18.0),
                child: new RaisedButton(onPressed: ()=> _signOut(), child: new Text('Sign OUT'),),
              ),
              Padding(
                padding: new EdgeInsets.all(18.0),
                child: Text('${_getCurrentUser().toString()}', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),)
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onEntryAdded(Event event) {
    setState(() {
      boardMessages.add(Board.fromSnapshot(event.snapshot));
    });
  }

  void handleSubmit() {
    final FormState form = formKey.currentState;

    if (form.validate()) {
      form.save();
      form.reset();

      databaseReference.push().set(board.toJson());
    }
  }

  void _onEntryChanged(Event event) {
    var oldEntry = boardMessages.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });
    setState(() {
      boardMessages[boardMessages.indexOf(oldEntry)] =
          Board.fromSnapshot(event.snapshot);
    });
  }
  Future<FirebaseUser> _gSignIn() async {

    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    FirebaseUser user = await auth.signInWithGoogle(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    print('user is :: ${user.displayName}');

    return user;


  }

  Future<FirebaseUser> _getCurrentUser()async {

    FirebaseUser user = await auth.currentUser().then((user){

      print(user);

    });
    return user;
  }

  Future _createUser() async {
    FirebaseUser user = await auth.createUserWithEmailAndPassword(
        email: "test1@gmail.com", password: 'test12345'
    ).then((user){
      print("user created ${user.displayName}");
      print("Email : ${user.email}");

    });

    return user;



  }

  Future _signIn() async {

    FirebaseUser user = await auth.signInWithEmailAndPassword(
        email: "test1@gmail.com",
        password: "test12345").then((user){
          print('User signin Success ${user.email}');

    }).catchError((e)=> debugPrint("$e"));
    return user;

  }

  _signOut() {
    if(auth.currentUser() != null){
      print(auth.currentUser().toString());
      setState(() {
        auth.signOut().then((user){
          print('${user} signed OUT');
          
        });
      });

    }

  }


}
