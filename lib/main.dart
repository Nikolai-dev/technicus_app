import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
      home: Splashscreen(), //Aufrufen des stful-Widgets Splashscreen
    );
  }
}


class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(   //GestureDetector, ermöglicht Drücken auf ganzen Bildschirm
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/SplashScreen_V2.1.png"), fit: BoxFit.cover,)  //Hintergrundbild
              ),),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,   //Ausrichtung am unteren Ende des Bildschirms
              children: [
                Text("TAP TO START...", style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                /*SpinKitWave(
                  size: 20,
                  itemBuilder: (BuildContext context, int index){
                    return DecoratedBox(decoration: BoxDecoration(          //Auskommentierter Code -> Sorgt dafür das Kreiselemente als Quadrat angezeigt werden
                      color: index.isEven ? Colors.white : Colors.blue
                    ),);
                  },
                )*/
                SpinKitFadingCircle(color: Colors.white,size: 35,)  //Drehender Kreis
              ],
            )
          ],
        ),
      ),
      onTap: (){
        Future<http.Response> rsp= login();
        rsp.then((result){
          if(result.body == '{"status": "key accepted"}'){
            print('login done.');

            Future<http.Response> res = request({"Earthquakes": "0"});
            res.then((resF){
              print(resF.body);

              var myData = jsonDecode(resF.body);


              Set<Circle> earthquakes = {};
              print(myData.length);
              for(int i = 0; i < myData.length; i++){

                earthquakes.add(
                    Circle(
                        circleId: CircleId(i.toString()),
                        radius: myData[i][3]*300000,
                        center: LatLng(myData[i][1],myData[i][0]),
                        fillColor: Colors.red.withOpacity(0.35),
                        strokeWidth: 1,
                        visible: true
                    ));

                print(i);
              }

              Navigator.push(context, MaterialPageRoute(builder: (context)=> Map(myMapType: MapType.hybrid,earthquakeslist: earthquakes,)));

            });
          }
        });
      },
    );
  }
}

Future<http.Response> login() {
  String loginURL= "http://185.119.117.86:8080/api/login";
  Future<http.Response> response= http.get(Uri.encodeFull(loginURL), headers: {'key': '6ru6dsh5kD8oHC79a_78segQ5_eR96'});
  return response;
}

Future<http.Response> request(var headers){
  Future<http.Response> response = http.get(Uri.encodeFull("http://185.119.117.86:8080/api"), headers: headers);

  return response;
}
