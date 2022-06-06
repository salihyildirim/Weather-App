import 'package:flutter/material.dart';

class BackGroundDecoration {
  String resim = '';

  BackGroundDecoration({required this.resim});

  BoxDecoration getBackGround() {
    return BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover, image: AssetImage('assets/$resim.jpg')));
  }
}

class StilOfText {
  TextStyle titleStyle() {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25,
    );
  }

  TextStyle valueStlye() {
    return TextStyle(fontSize: 18, fontStyle: FontStyle.italic);
  }
}
