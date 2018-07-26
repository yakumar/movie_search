import 'dart:async';
import 'package:rxdart/rxdart.dart';


class Bloc {

  List<Task> taskList = [];



}

class Task{
  String title;
  String subject;

  Task({this.title, this.subject});
}


/*

Task List of Task Map -> title subject

[{title:'', subject:''}, {title1: '', subject1:''}];

list[0].title
list[0].subject
 */