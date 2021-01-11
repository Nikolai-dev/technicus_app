
import 'package:flutter/material.dart';
import 'package:flutter_technicus/secondPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main() {
  runApp(App());
}


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),

    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/woods.jpg"), fit: BoxFit.cover,),
              ),
            ),
            Center(
                child: Text("What's up world?",
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
      ),
      onTap: () async{

        String loginURL = 'http://192.168.1.121:69/api/login';
        var response = await http.get(
            Uri.encodeFull(loginURL), headers: {'key': '6ru6dsh5kD8oHC79a_78segQ5_eR96'});
        //print('ok');
        if(response.statusCode == 200){
          var body= jsonDecode(response.body);
          print(response.body);
          if(body['status'] == 'key accepted'){

            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Menu()));
          }

        }
        else{
          print('scheisse');

        }
      }
    );
  }
}





