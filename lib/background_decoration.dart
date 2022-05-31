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
    return TextStyle(fontWeight: FontWeight.bold, fontSize: 30);
  }

  TextStyle valueStlye() {
    return TextStyle(fontSize: 25);
  }
}
