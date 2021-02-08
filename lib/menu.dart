import 'package:flutter/material.dart';
import 'map.dart';

class Menu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 0, 0, 1),
        title: Text('Menü',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 25,
          color: Colors.white
        )),
      ),
      
      body: Container(
        //size
        height: double.infinity,
        width: double.infinity,

        //background picture
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/Menu_V2.png"), fit: BoxFit.cover)
        ),


        //ListView
        child: ListView.separated(
          //identation
          padding: const EdgeInsets.all(46),

          //number of containers
          itemCount: 5,

          //is building 42 containers
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              //color + transparency
              color: Color.fromRGBO(100, 149, 237, 0.5).withOpacity(0.4),
              child: GestureDetector(
                child: Center(
                  child: Text('Go to Map',
                  style:TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    color: Colors.white,
                  ) ),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Map()));
                },
              )
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        ),
      )
    );
  }
}
