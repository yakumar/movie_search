
import 'dart:async';

import 'validators.dart';

import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Vaidators{

  final _emailController = new BehaviorSubject<String>();

  final _passwordController = new BehaviorSubject<String>();



  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  Stream<String> get email => _emailController.stream.transform(validateEmail);

  Stream<String> get pass => _passwordController.stream.transform(validatePassword);

  Stream<bool> get submitValid => Observable.combineLatest2(email, pass, (e, p)=> true);


  dispose(){
    _passwordController.close();
    _emailController.close();
  }

  submit(){
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;
    
    print('email: $validEmail');
    print('password $validPassword');

  }


}

