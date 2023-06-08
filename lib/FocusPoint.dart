//import 'package:flutter/material.dart';
//import 'package:version1/Shottype.dart';

class FocusPoint {
  FocusPoint(
      {required this.name,
      required this.difficulty,
      required this.contentEN,
      required this.contentDE});
  String name;
  //Image illustration;
  String difficulty;
  String contentEN;
  String contentDE;

  String getName() => name;
  String getDifficulty() => difficulty;
  String getEN() => contentEN;
  String getDE() => contentDE;
}
