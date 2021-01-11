import 'package:flutter/material.dart';

        class Pic extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
        return Container(
        decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage('https://cdni.pornpics.com/1280/5/236/33457610/33457610_004_351b.jpg'),
            fit: BoxFit.cover,
        ),

    ));

  }
}
