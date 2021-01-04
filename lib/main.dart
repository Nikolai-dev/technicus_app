import 'package:flutter/material.dart';

void main() => runApp(MaterialApp (home: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(Icons.ac_unit,
            color: Colors.white70,
            size: 100,
        ),
        backgroundColor: Colors.brown[600],
      ),
      body: Center(
        child: Text("Fuck them all!"),
      )

    );
  }
}
