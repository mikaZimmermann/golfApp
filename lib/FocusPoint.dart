//import 'package:flutter/material.dart';
//import 'package:version1/Shottype.dart';

class FocusPoint {
  FocusPoint(
      {required this.name, required this.contentEN, required this.contentDE});
  String name;
  //Image illustration;
  String contentEN;
  String contentDE;

  String getName() => name;
  String getEN() => contentEN;
  String getDE() => contentDE;
}
