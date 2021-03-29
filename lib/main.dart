import 'package:flutter/material.dart';
import 'package:flutter_technicus/menu.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


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
                image: DecorationImage(image: AssetImage("assets/SplashScreen_V2.png"), fit: BoxFit.cover,),
              ),
            ),
          ],
        ),
      ),


        //http request, triggered by tap on screen
      onTap: (){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Menu()));

    }
        /*async{

        String loginURL = 'http://192.168.1.121:5000/api/login';
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
      }*/

    );
  }
}





