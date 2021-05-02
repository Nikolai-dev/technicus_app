import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';

class Map extends StatefulWidget {
  Set<Polygon> polygonList;
  Set<Circle> earthquakeslist;

  var myMapType;
  Map({this.myMapType, this.polygonList, this.earthquakeslist});
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {

  GoogleMapController mapController;
  LatLng startPos = LatLng(-3.4527, 145.7212);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
       // title: Text("Slidemenu"),
        backgroundColor: Colors.transparent//Colors.grey[800], //Color.fromRGBO(240, 248, 255, 99)//Colors.transparent,//Color.fromRGBO(39, 64, 139, 100)
      ),
      drawer: new Drawer(
        child: ListView(
          children:<Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                    Colors.black,
                    Colors.grey[800]
                  ])
                ),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      elevation:10,
                      child: Padding(padding: EdgeInsets.all(8.0),
                          child: Image.asset("assets/Flutter Logo.png", width: 80, height:80),),
                    ),
                    Padding(padding: EdgeInsets.all(8.0),child: Text("Earthtastic",style: TextStyle(color: Colors.white, fontSize: 21.0),),)
                  ],
                )
              ),),
            CustomListTile(Icons.settings, "Settings", ()=>{}),
            CustomListTile(Icons.fireplace_outlined, "Waldbrände", ()=>{}),
            CustomListTile(Icons.water_damage, "Tsunami",()=>{}),
           CustomListTile(Icons.dangerous,"Erdbeben", ()=>{}),
          ],
        )
      ),
      body:
      GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
          target: startPos,
          zoom: 10
      ),

      mapType: widget.myMapType,
      polygons: widget.polygonList,
      circles: widget.earthquakeslist,
      ),
     // floatingActionButton: FloatingActionButton.extended(
       // onPressed: _goToTheLake,
       // label: Text('To the lake!'),
        //icon: Icon(Icons.directions_boat),

      //),

    );

   // return GoogleMap(
     // onMapCreated: _onMapCreated,
     // initialCameraPosition: CameraPosition(
      //    target: startPos,
    //      zoom: 10
     // ),
     // mapType: widget.myMapType,
     // polygons: widget.polygonList,
    // circles: widget.earthquakeslist,
     //);
  }
}

class CustomListTile extends StatelessWidget{

  IconData icon;
  String text;
  Function onTap;
  CustomListTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(
            color: Colors.grey.shade400
          ))
        ),
        child: InkWell(
          splashColor: Colors.grey[800],
        onTap: onTap,
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
             Row(
               children: <Widget>[
              Icon(icon),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:  Text(text,style: TextStyle(
                  fontSize: 16.0,
              ),
              )),
              ],
              ),
              Icon(Icons.arrow_drop_down_sharp),
            ],
          ),
        ),
      ),
      ),
    );
  }
}