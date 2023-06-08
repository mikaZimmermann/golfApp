import 'package:flutter/material.dart';
import 'package:version1/Exercise.dart';
//import 'package:version1/Shottype.dart';

//import 'ExecutionRecord.dart';
import 'FocusPoint.dart';

class DisplayExercise extends StatefulWidget {
  DisplayExercise({super.key, required this.focusPoints, required this.exercises
      /*required this.records*/
      });
  final List<FocusPoint> focusPoints;
  final List<Exercise> exercises;
  //final List<ExecutionRecord> records;
  //final List<Shottype> shottypes;

  //final List<String> exerciceS = ['Exercise 1', 'Exercise 2', 'Exercise 3'];
  @override
  State<DisplayExercise> createState() => _DExerciseState();
}

class _DExerciseState extends State<DisplayExercise> {
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
    exerciseToggleValues = List<bool>.filled(widget.exercises.length,
        false); // initialize dynamically with false when the state is created
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exercises')),
      body: ListView.builder(
        itemCount: widget.exercises.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(widget.exercises[index].getDesc().name),
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
