import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'map.dart';


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
          Future<http.Response> rsp= login();
          rsp.then((result){
            if(result.body == '{"status": "key accepted"}'){
              print('login done.');

              Future<http.Response> res = request({"Earthquakes": "0"});
              res.then((resF){
                print(resF.body);

               // String responseString = '{"place":  "norway",  "mag": 5,  "exampleList": [1, 8, 9, 6]}';
                //Map<String, dynamic> myData = jsonDecode(resF.body);

                var myData = jsonDecode(resF.body);

               // Set<Circle> earthquakelist;

                //earthquakelist.add

                //print(myData.length);
                //print(myData[17][6]);

                Set<Circle> earthquakes = {};
                print(myData.length);
                for(int i = 0; i < myData.length; i++){

                  earthquakes.add(
                    Circle(
                     circleId: CircleId(i.toString()),
                      radius: myData[i][3]*10000,
                      center: LatLng(myData[i][1],myData[i][0]),
                      fillColor: Colors.brown.withOpacity(0.35),
                      strokeWidth: 1
                        ,visible: true
                    ));

                  print(i);
                }

                Navigator.push(context, MaterialPageRoute(builder: (context)=> Map(myMapType: MapType.hybrid,earthquakeslist: earthquakes,)));

              });
            }
          });
        }


    );
  }
}

Future<http.Response> login() {
  String loginURL= "http://jojotech.one:3333/api/login";
  Future<http.Response> response= http.get(Uri.encodeFull(loginURL), headers: {'key': '6ru6dsh5kD8oHC79a_78segQ5_eR96'});
  return response;
}

Future<http.Response> request(var headers){
  Future<http.Response> response = http.get(Uri.encodeFull("http://jojotech.one:3333/api"), headers: headers);

  return response;
}
