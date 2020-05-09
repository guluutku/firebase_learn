import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutterfbconn/Pages/Setup/signUp.dart';
import '../home.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  String _email, _password;

  final GlobalKey<FormState> _fKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase App'),
      ),
      body: Center(
        child:Form(
          key: _fKey,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,

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
            child: Text('sign-in'),
          ),

          RaisedButton(
            onPressed: signUp,
            child: Text('sign-up'),
          ),
        ],
      ),
      ),
      ),
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

  void signUp(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
  }


}
