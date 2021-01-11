import 'videostest.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: IconButton(
          icon: Icon(Icons.delete_outline),
          splashColor: Colors.greenAccent,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => FourthPage())
            );
          },
        ),
      )
    );
  }
}

class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.network('https://content4.coedcherry.com/passion-hd/213753/lana_rhoades_06.jpg'),

      ),
         onDoubleTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Pic()));
    } ,
    );
  }
}

