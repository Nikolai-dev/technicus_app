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
            Set<Circle> earthquakes_wildfires = {};

            Future<http.Response> resEQ = request({"Earthquakes": "0"});
            resEQ.then((resF){
              var EQdata = jsonDecode(resF.body);
              for(int i = 0; i < EQdata.length; i++){
                earthquakes_wildfires.add(
                    Circle(
                        circleId: CircleId("eq"+i.toString()),
                        radius: EQdata[i][3]*300000,
                        center: LatLng(EQdata[i][1],EQdata[i][0]),
                        fillColor: Colors.red.withOpacity(0.35),
                        strokeWidth: 1,
                        visible: true
                    ));
              }
              Future<http.Response> resWF= request({"Wildfires": ""});
              resWF.then((resFWF) {
                var WFdata= jsonDecode(resFWF.body);
                for(int i = 0; i < WFdata.length; i++){
                  earthquakes_wildfires.add(
                    Circle(
                      circleId: CircleId("wf"+i.toString()),
                      radius: 35000,
                      center: LatLng(WFdata[i][0], WFdata[i][1]),
                      fillColor: Colors.orange.withOpacity(0.5),
                      strokeWidth: 1,
                      visible: true,
                    )
                  );
                }

                Future<http.Response> resPush= request({"Push": ""});
                resPush.then((resFPush){
                  var PUSHdata= jsonDecode(resFPush.body);
                  print(PUSHdata.runtimeType);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Map(myMapType: MapType.hybrid,earthquakes_wildfires: earthquakes_wildfires, PUSHdata: PUSHdata,)));
                });
              });

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
