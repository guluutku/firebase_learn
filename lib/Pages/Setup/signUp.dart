import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  String _email, _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Join Our Family'),
      ),
      body: Center(
        child: Form(
          key: _formKey,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: <Widget>[
              TextFormField(
                validator: (input){
                  if(input.isEmpty){
                    return 'Write ';
                  }
                },
                onSaved: (input) => _email = input,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),

              TextFormField(
                validator: (input){
                  if(input.isEmpty){
                    return 'Write ';
                  }
                },
                onSaved: (input) => _password = input,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),

              RaisedButton(
                onPressed: signUp,
                child: Text('signUp'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signUp() async{
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        FirebaseUser user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password)).user;
        //send a email to user
        //user.sendEmailVerification();
        Navigator.of(context).pop();
      } catch(e){
        print(e.message);
      }
    }
  }
}
