import 'dart:io';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';

class Map extends StatefulWidget {
  Set<Circle> earthquakes_wildfires;
  var PUSHdata;

  var myMapType;

  Map({this.myMapType, this.earthquakes_wildfires, this.PUSHdata});

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  GoogleMapController mapController;
  LatLng startPos = LatLng(1, 1);
  var pushMarker= Marker(
      markerId: MarkerId("push"),
      draggable: false,
      visible: false,
      infoWindow: InfoWindow(
        title: "ANTARCTICA",
        snippet: "big iceberg splitted"
      ),
    position: LatLng(0,0),
  );

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: startPos, zoom: 10),
        mapType: widget.myMapType,
        circles: widget.earthquakes_wildfires,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton.extended(
            onPressed: () {
              _setVisibilityInMenu(context);
            },
            label: Text('Menu', style: TextStyle(fontSize: 20)),
            icon: Icon(Icons.menu),
            backgroundColor: Colors.transparent,
          ),
          FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => News(data: widget.PUSHdata)));
            },
            label: Text('Push', style: TextStyle(fontSize: 20)),
            icon: Icon(Icons.new_releases_outlined),
            backgroundColor: Colors.transparent,
          ),
        ],
      )

    );
  }

  void _setVisibilityInMenu(BuildContext context) async {
    var result= await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ScaffoldN()),
    );
    bool visibilityEQ= result[0];
    bool visibilityWF= result[1];

    setState(() {
      Set<Circle> new_eq_wf= {};
      for(var element in widget.earthquakes_wildfires){
        bool visible;
        if(element.circleId.value[0] == 'e'){
          visible= visibilityEQ;
        }else if(element.circleId.value[0] == 'w'){
          visible= visibilityWF;
        }
        new_eq_wf.add(
          new Circle(
            circleId: element.circleId,
            center: element.center,
            fillColor: element.fillColor,
            strokeWidth: element.strokeWidth,
            visible: visible,
          )
        );
        }
        widget.earthquakes_wildfires= new_eq_wf;
    });

  }
}

class CustomListTile extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
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
                      child: Text(
                        text,
                        style: TextStyle(
                          fontSize: 19.0, fontWeight: FontWeight.bold
                        ),
                      )),
                ],
              ),
             // Icon(Icons.arrow_drop_down_sharp),
            ],
          ),
        ),
      ),
    );
  }
}

class ScaffoldN extends StatefulWidget {
  @override
  _ScaffoldNState createState() => _ScaffoldNState();
}

class _ScaffoldNState extends State<ScaffoldN> {

  final allChecked = CheckBoxModal(title: 'Select all', value: true);
  final checkBoxLIst = [
    CheckBoxModal(title: "Earthquakes", value: true),
    CheckBoxModal(title: "Forest fires", value: true),
    CheckBoxModal(title: "Tsunamis", value: true),
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Menu",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context, [this.checkBoxLIst[0].value, this.checkBoxLIst[1].value, this.checkBoxLIst[2].value]);
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
          child: ListView(
            children: [
              Material(
                //borderRadius: BorderRadius.all(Radius.circular(50.0)),
                elevation: 10,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset("assets/Flutter Logo.png",
                      width: 80, height: 80),
                ),
              ),
              Material(
                child: CustomListTile(Icons.settings, "Settings", () => {}),
              ),

              ListTile(
                onTap: ()=> onAllClicked(allChecked),
                leading: Checkbox(
                  value: allChecked.value,
                  onChanged: (value) => onAllClicked(allChecked),
                ),
                title: Text(allChecked.title, style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold,
                )),
              ),
              Divider(),
              ...checkBoxLIst.map((item) =>
                  ListTile(
                    onTap: ()=> onItemClicked(item),
                    leading: Checkbox(
                      value: item.value,
                      onChanged: (value) => onItemClicked(item),
                    ),
                    title: Text(item.title, style: TextStyle(
                      fontSize: 18,
                    )),
                  )
              ).toList(),
              /*Material(
                child: CustomListTile(Icons.settings, "Settings", () => {}),  //PLatz zum Hinzufügen von weiteren Buttons
              )*/
            ],
          ),
      ),
    );
  }

  onAllClicked(CheckBoxModal ckbItem) {
    final newValue = !ckbItem.value;
    setState(() {
      ckbItem.value = newValue;
      checkBoxLIst.forEach((element) {
        element.value = newValue;
      });

    });
  }

  onItemClicked(CheckBoxModal ckbItem){
    final newValue = !ckbItem.value;
    setState(() {
      ckbItem.value = newValue;

      if(!newValue){
        allChecked.value = false;
      }
      else{
        final allListChecked = checkBoxLIst.every((element) => element.value);
        allChecked.value = allListChecked;
      }
    });
  }
}

class CheckBoxModal{
  String title;
  bool value;

  CheckBoxModal({@required this.title, this.value = false});
}

class News extends StatefulWidget{
  var data;
  News({this.data});
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Push News",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        ),
        body: Center(
          child: ListView.separated(
            padding: EdgeInsets.all(13),
              itemCount: widget.data.length,
              itemBuilder: (context, index) {
                print(widget.data);
                return Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    border: Border.all(width: 5),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        spreadRadius: 7,
                        blurRadius: 5,
                        offset: Offset(0, 0), // changes position of shadow
                ),
                ],
                    ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(widget.data[index][0], style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(widget.data[index][1], style: TextStyle(fontWeight: FontWeight.normal))
                    ],
                  ),
                  );
              },
            separatorBuilder: (BuildContext context, int index){
              return SizedBox(height: 20);
            },
          )
        )
    );
  }
}
