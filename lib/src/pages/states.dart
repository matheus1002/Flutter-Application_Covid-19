import 'package:flutter/material.dart';

class States extends StatefulWidget {
  @override
  _StatesState createState() => _StatesState();
}

class _StatesState extends State<States> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      //backgroundColor: Color(0xB3063d61),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("STATES")
        ],
      ),
    );
  }
}
