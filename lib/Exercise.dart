//import 'package:flutter/material.dart';
//import 'package:version1/Shottype.dart';

import 'ExecutionRecord.dart';
import 'FocusPoint.dart';
import 'ExerciseDescription.dart';

class Exercise {
  Exercise(
      {required int ID,
      required ExerciseDescription Desc,
      required List<FocusPoint> FocusPoints,
      required List<ExecutionRecord> Records})
      : _id = ID,
        _desc = Desc,
        _focusPoints = FocusPoints,
        _records = Records;

  final int _id;
  final ExerciseDescription _desc;
  final List<FocusPoint> _focusPoints;
  final List<ExecutionRecord> _records;
  //final List<Shottype> shottypes;

  int get id => _id;
  ExerciseDescription get desc => _desc;
  List<FocusPoint> get focusPoints => _focusPoints;
  List<ExecutionRecord> get records => _records;

  void addRecord(ExecutionRecord record) {
    _records.add(record);
  }
}
