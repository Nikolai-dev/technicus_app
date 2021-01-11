import 'package:flutter/material.dart';

        class Pic extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
        return Container(
        decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage('https://cdni.pornpics.com/1280/7/306/18293835/18293835_066_b1ba.jpg'),
            fit: BoxFit.cover,
        ),

    ));

  }
}
