import 'package:flutter/material.dart';

class States extends StatefulWidget {
  @override
  _StatesState createState() => _StatesState();
}

class _StatesState extends State<States> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.green,
      backgroundColor: Color(0xB3063d61),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "States",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }


}
