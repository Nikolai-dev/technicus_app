import 'dart:io';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
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
    return new Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: startPos, zoom: 10),
        mapType: widget.myMapType,
        polygons: widget.polygonList,
        circles: widget.earthquakeslist,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          //Navigator.push(context, MaterialPageRoute(maintainState: true, builder: (context) => Test()));
          Navigator.of(context).push(PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, _, __) {
                return ScaffoldN();
              }));
        },
        label: Text('Menu', style: TextStyle(fontSize: 20)),
        icon: Icon(Icons.menu),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
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

class DrawerM2 extends StatefulWidget {
  @override
  _DrawerM2State createState() => _DrawerM2State();
}

class _DrawerM2State extends State<DrawerM2> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
//color: Colors.transparent
                  gradient: LinearGradient(
                      colors: <Color>[Colors.black, Colors.grey[800]])
              ),
              child: Container(
                  child: Column(
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        elevation: 10,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image.asset("assets/Flutter Logo.png",
                              width: 80, height: 80),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          "Earthtastic",
                          style: TextStyle(color: Colors.white, fontSize: 21.0),
                        ),
                      )
                    ],
                  )),
            ),
            CustomListTile(Icons.settings, "Settings", () =>{}),
            Checkbox(),
            // Navigator.push(context, MaterialPageRoute(builder: (context)=> Map(myMapType: MapType.hybrid)));

          ],
        ));
  }
}

class DrawerM extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
//color: Colors.transparent
                  gradient: LinearGradient(
                      colors: <Color>[Colors.black, Colors.grey[800]])
              ),
              child: Container(
                  child: Column(
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        elevation: 10,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image.asset("assets/Flutter Logo.png",
                              width: 80, height: 80),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          "Earthtastic",
                          style: TextStyle(color: Colors.white, fontSize: 21.0),
                        ),
                      )
                    ],
                  )),
            ),
            CustomListTile(Icons.settings, "Settings", () => {}),
          ],
        ));
  }
}

/*return new Drawer(
/*child: Theme(
        data: Theme.of(context).copyWith(
      // Set the transparency here
      canvasColor: Colors.transparent, //or any other color you want. e.g Colors.blue.withOpacity(0.5)
    ),*/
child: ListView(
children: <Widget>[
DrawerHeader(
decoration: BoxDecoration(
//color: Colors.transparent
gradient: LinearGradient(
colors: <Color>[Colors.black, Colors.grey[800]])
),
child: Container(
child: Column(
children: <Widget>[
Material(
borderRadius: BorderRadius.all(Radius.circular(50.0)),
elevation: 10,
child: Padding(
padding: EdgeInsets.all(8.0),
child: Image.asset("assets/Flutter Logo.png",
width: 80, height: 80),
),
),
Padding(
padding: EdgeInsets.all(5.0),
child: Text(
"Earthtastic",
style: TextStyle(color: Colors.white, fontSize: 21.0),
),
)
],
)),
),
CustomListTile(Icons.settings, "Settings", () => {}),
CustomListTile(Icons.fireplace_outlined, "Waldbrände", () => {}),
CustomListTile(Icons.water_damage, "Tsunami", () => {}),
CustomListTile(Icons.dangerous, "Erdbeben", () => {}),
],
));*/

Widget _buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('Popup example'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Hello"),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: Text('Close'),
      ),
    ],
  );
}

/*class Checkbox extends StatefulWidget {
  //String text;
  //Checkbox(this.text);

  @override
  _CheckboxState createState() => _CheckboxState();
}*/
/*class _CheckboxState extends State<Checkbox> {

  //String text;

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
                  new CheckboxListTile(value: false, onChanged: (value) {

                  },),
                  /* Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        text,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      )),*/
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/


class DrawerPetautschnig extends StatefulWidget {
  @override
  _DrawerPetautschnigState createState() => _DrawerPetautschnigState();
}

class _DrawerPetautschnigState extends State<DrawerPetautschnig> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children:<Widget>[
          Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: <Widget>[
                  Material(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    elevation: 10,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image.asset("assets/Flutter Logo.png",
                          width: 80, height: 80),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Earthtastic",
                      style: TextStyle(color: Colors.black, fontSize: 21.0),
                    ),
                  ),
                  Material(
                    child: CustomListTile(Icons.settings, "Settings", () => {}),

                  ),
                  // Material(
                  // child: Checkbox(),
                  // )

                ],

              )),

        ]
    );
  }
}

class DrawerP2 extends StatefulWidget {
  @override
  _DrawerP2State createState() => _DrawerP2State();
}

class _DrawerP2State extends State<DrawerP2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Material(
           borderRadius: BorderRadius.all(Radius.circular(50.0)),
            elevation: 10,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Image.asset("assets/Flutter Logo.png",
                  width: 80, height: 80),
            ),
          ),
         /* Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              "Earthtastic",
              style: TextStyle(color: Colors.black, fontSize: 21.0),
            ),
          ),*/
          Material(
            child: CustomListTile(Icons.settings, "Settings", () => {}),

          ),
        ],
      )
    );
  }
}

class ScaffoldN extends StatefulWidget {
  @override
  _ScaffoldNState createState() => _ScaffoldNState();
}

class _ScaffoldNState extends State<ScaffoldN> {

  final allChecked = CheckBoxModal(title: 'Alle auswählen');
  final checkBoxLIst = [
    CheckBoxModal(title: "Erdbeben"),
    CheckBoxModal(title: "Waldfeuer"),
    CheckBoxModal(title: "Tsunami"),
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Menu",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
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
               //new Checkbox(value: false, onChanged: (onChanged){print("OK");}),
               //  new Icon(Icons.change_history),
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