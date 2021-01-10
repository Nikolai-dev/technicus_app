import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Icon(Icons.ac_unit,
              color: Colors.white70,
              size: 500,
            ),
            backgroundColor: Colors.brown[600],
          ),
          body:
          Center(
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Hallo!",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Lato",

                    ),

                  ),

                ),
                IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => App()));
                    }
                      )
              ],
            ),
          )

      ),
    );
  }
}





















