import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Icon(Icons.ac_unit,
            color: Colors.white70,
            size: 500,
          ),
          backgroundColor: Colors.brown[600],
        ),
        body: Center(
          child: Text(
            "Hallo!",
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w600,
              fontFamily: "Lato",
            ),
          ),
        )
    );
  }
}

