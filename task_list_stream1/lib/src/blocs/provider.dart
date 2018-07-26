import 'package:flutter/material.dart';

import 'dart:async';
import 'bloc.dart';

class Provider extends InheritedWidget{

  final Bloc bloc = new Bloc();

//    StreamIterator<String> dataController = new StreamIterator(bloc.title);



  Provider({Key key, Widget child}) : super(key: key, child: child);


  @override
  bool updateShouldNotify(_) {
    // TODO: implement updateShouldNotify
    return true;
  }

  static Bloc of(BuildContext context){
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }


}