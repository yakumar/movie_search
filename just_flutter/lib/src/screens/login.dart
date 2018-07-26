import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';



class Login extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);


    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Login'),
        backgroundColor: Colors.lime,
      ),
      body: new Center(
        child: Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              emailField(bloc),
              passwordField(bloc),
              Container(margin: EdgeInsets.all(10.0),),
              submitBtn(bloc),

            ],
          ),
        ),
      ),
    );
  }

  Widget emailField(Bloc bloc) {

    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot){
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: new InputDecoration(
              labelText: ' Email Address',
              hintText: 'you@example.com',
            errorText: snapshot.error,
          ),
        );

      },

    );


    
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.pass,
      builder: (context, snapshot){
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: new InputDecoration(
            errorText: snapshot.error,

              labelText: ' password ',
              hintText: 'password'
          ),
        );

      },
    );

  }

  submitBtn(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot){
        //print(snapshot.hasError);
        return RaisedButton(


          onPressed: snapshot.hasData ? bloc.submit: null ,
          child: Text('Submit'),
        );
      },

    );

  }
}
