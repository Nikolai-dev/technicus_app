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
  LatLng startPos = LatLng(1, 1);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
          target: startPos,
          zoom: 10
      ),
      mapType: widget.myMapType,
      polygons: widget.polygonList,
      circles: widget.earthquakeslist,
     );
  }
}