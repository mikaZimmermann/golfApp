import 'package:flutter/material.dart';
//import 'package:version1/Shottype.dart';

import 'ExecutionRecord.dart';
import 'FocusPoint.dart';

class Exercise extends StatefulWidget {
  const Exercise(
      {super.key,
      required this.id,
      required this.focusPoints,
      required this.records});
  final int id;
  final List<FocusPoint> focusPoints;
  final List<ExecutionRecord> records;
  //final List<Shottype> shottypes;
  @override
  State<Exercise> createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  /*
 ____________________________________________________________________________________
 This class needs to destroy its parent object after creating a
 new instance with the lastest execution added to List<ExecutionRecord>
 records of parent records
 
  */

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
