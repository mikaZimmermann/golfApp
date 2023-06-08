import 'package:flutter/material.dart';
//import 'package:version1/Shottype.dart';

//import 'ExecutionRecord.dart';
import 'FocusPoint.dart';

class Exercise extends StatefulWidget {
  Exercise({
    super.key,
    required this.id,
    required this.focusPoints,
    /*required this.records*/
  });
  final int id;
  final List<FocusPoint> focusPoints;
  //final List<ExecutionRecord> records;
  //final List<Shottype> shottypes;
  final List<String> exercices = ['Exercise 1', 'Exercise 2', 'Exercise 3'];
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
  late List<bool>
      exerciseToggleValues; // late means it is used when it is required or initialized when it is required

  @override
  void initState() {
    super.initState();
    exerciseToggleValues = List<bool>.filled(widget.exercices.length,
        false); // initialize dynamically with false when the state is created
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exercises')),
      body: ListView.builder(
        itemCount: widget.exercices.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(widget.exercices[index]),
            trailing: Switch(
              value: exerciseToggleValues[index],
              onChanged: (bool newValue) {
                setState(() {
                  exerciseToggleValues[index] = newValue;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
