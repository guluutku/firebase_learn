import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutterfbconn/Pages/home.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;

  final GlobalKey<FormState> _fKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          key: _fKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (input){
                  if(input.isEmpty){
                    return 'Write somthing';
                  }
                },
                onSaved: (input) => _email = input,
                decoration: InputDecoration(
                  labelText: "Email",
                ),
              ),


              TextFormField(
                validator: (input){
                  if(input.isEmpty){
                    return 'Write somthing';
                  }
                },
                onSaved: (input) => _password = input,
                decoration: InputDecoration(
                  labelText: "Password",
                ),
                obscureText: true,
              ),

              RaisedButton(
                onPressed: signIn,
                child: Text('Sign-in'),
              ),
            ],
          ),
        ),
      )
    );
  }

  Future<void> signIn() async{
    final formState = _fKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
        AuthResult user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      }catch(e){
        print(e.message);
      }
    }
  }

}

