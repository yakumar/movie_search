
import 'package:firebase_database/firebase_database.dart';

class Patient {
  String key;

  String name;
  String age;
  String sex;

  String chiefComplaint;

  String diagnosis;

  String treatmentDone;
  String something;


  String payment;
  int dateTime = new DateTime.now().millisecondsSinceEpoch;


  Patient(this.name, this.sex, this.chiefComplaint, this.diagnosis, this.treatmentDone, this.payment);

//  Board.fromSnapshot(DataSnapshot snapshot){
//    key = snapshot.key;
//    subject = snapshot.value['subject'];
//    body = snapshot.value['body'];
//
//  }

  Patient.fromSnapshot(DataSnapshot snapshot){
    key = snapshot.key;
    name = snapshot.value['name'];
    age = snapshot.value['age'];
    sex = snapshot.value['sex'];
    chiefComplaint = snapshot.value['chiefComplaint'];
    diagnosis = snapshot.value['diagnosis'];
    treatmentDone = snapshot.value['treatmentDone'];
    payment = snapshot.value['payment'];
    dateTime = snapshot.value['dateTime'];
    something = snapshot.value['something'];





  }


  toJson(){
    return {

    "sex": sex,
    "chiefComplaint": chiefComplaint,
     "diagnosis": diagnosis,
     "treatmentDone" : treatmentDone,
      "payment": payment,
      "dateTime": dateTime,
      "something": something,
      "name": name,
      "age": age,


    };

  }




}
