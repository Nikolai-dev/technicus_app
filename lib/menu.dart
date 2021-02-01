import 'package:flutter/material.dart';
import 'map.dart';

class Menu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Menu'),
      ),
      
      body: Container(
        //size
        height: double.infinity,
        width: double.infinity,

        //background picture
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/vulcano.jpg"), fit: BoxFit.cover)
        ),


        //ListView
        child: ListView.separated(
          //identation
          padding: const EdgeInsets.all(46),

          //number of containers
          itemCount: 42,

          //is building 42 containers
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              //color + transparency
              color: Colors.deepPurple.withOpacity(0.7),
              child: GestureDetector(
                child: Center(
                  child: Text('Go to Map'),
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
