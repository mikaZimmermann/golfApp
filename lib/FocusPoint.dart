//import 'package:flutter/material.dart';
//import 'package:version1/Shottype.dart';

class FocusPoint {
  const FocusPoint(
      {required this.name,
      required this.difficulty,
      required this.contentEN,
      required this.contentDE});
  final String name;
  //Image illustration;
  final String difficulty;
  final String contentEN;
  final String contentDE;

  String getName() => name;
  String getDifficulty() => difficulty;
  String getEN() => contentEN;
  String getDE() => contentDE;
}
