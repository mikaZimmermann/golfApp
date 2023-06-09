//import 'package:flutter/material.dart';
//import 'package:version1/Shottype.dart';

import 'ExecutionRecord.dart';
import 'FocusPoint.dart';
import 'ExerciseDescription.dart';

class Exercise {
  Exercise(
      {required this.id,
      required this.desc,
      required this.focusPoints,
      required this.records});
  final int id;
  final ExerciseDescription desc;
  final List<FocusPoint> focusPoints;
  final List<ExecutionRecord> records;
  //final List<Shottype> shottypes;

  int getID() => id;
  ExerciseDescription getDesc() => desc;
  List<FocusPoint> getfocusPoints() => focusPoints;

  void addRecord(ExecutionRecord record) {
    records.add(record);
  }
}
