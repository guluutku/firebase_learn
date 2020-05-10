import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfbconn/Pages/Anonymous/rentEquipment.dart';

class AnonymouslyPage extends StatefulWidget {
  @override
  _AnonymouslyPageState createState() => _AnonymouslyPageState();
}

class _AnonymouslyPageState extends State<AnonymouslyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Please select 'Kite Lessons' to make a appointment for the lessons "
                "or 'Rent Equipment' to rent our equipments:"),

            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RentalAnon())
                );
              },
              child: Text('Rent Equipments'),
            ),

            RaisedButton(
              onPressed: () {
                // Dersleralmaya git
              },
              child: Text('Rent Equipments'),
            ),


          ],
        ),
      ),
    );
  }
}
