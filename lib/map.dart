import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'menu.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  GoogleMapController mapController;

  //starting position on map
  final LatLng _center = const LatLng(29.97527, 31.13763);

  //Set of marker, contains 1 marker currently
  Set<Marker> _markers= {

    Marker(
      //id to identify a marker
      markerId: MarkerId(
        "marker1"
      ),

      //pos
      position: LatLng(29.97527,31.13763),

      //Text shown, when marker gets clicked
      infoWindow: InfoWindow(
        title: "Sphinx"
      ),
    )

  };

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 20.0,
        ),
        mapType: MapType.satellite,
        markers: _markers,
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.close, size: 40),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()));
                },

              ),
            label: 'back'
             ),

            BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.close, size: 40),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()));
                },
              ),
                label: "back"

            ),

            BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.close, size: 40),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()));
                },
              ),
              label: "back"
            ),
        ],
      ),
    );

  }
}
