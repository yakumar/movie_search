import 'dart:async';


class Vaidators {

  final validateEmail = new StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      if(email.contains('@')){
        sink.add(email);
      }else {
        sink.addError('Not a valid EMIAILA');
      }

    }

  );
  final validatePassword = new StreamTransformer<String, String>.fromHandlers(
    handleData: (pass, sink){
      if(pass.length > 6){
        sink.add(pass);
      } else {
        sink.addError('Password must be greater than 5 characters');
      }
    }

  );

}