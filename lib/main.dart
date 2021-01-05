import 'package:flutter/material.dart';
import 'package:flutter_technicus/secondPage.dart';

void main() => runApp(MaterialApp (home: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //backgroundColor: Colors.black54,
        body: FirstPage(),
      ),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 7),
        (){

      Navigator.push(context, new MaterialPageRoute(builder: (conext)=>NextPage()));
        }

    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(image: new AssetImage("assets/woods.jpg"), fit: BoxFit.cover,),
            ),
          ),
          new Center(
            child: new Text("What's up world?",
              style: TextStyle(
                fontSize: 49,
                fontWeight: FontWeight.w900,
                fontFamily: "Lato",
                color: Colors.white,
              )
            )
          ),
        ],

      ),
    );
  }
}


