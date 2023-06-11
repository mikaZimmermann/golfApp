import 'package:flutter/material.dart';
import 'package:version1/Exercise.dart';
//import 'package:version1/Exercise.dart';
import 'DisplayExercise.dart';

import 'FocusPoint.dart';

class TrainingPlan extends StatefulWidget {
  TrainingPlan(
      {super.key,
      required this.name,
      required this.focusPoint,
      required this.exercises});
  final String name;
  //final List<Shottype> elements;
  final List<FocusPoint> focusPoint;
  final List<Exercise> exercises;
  //final List<String> exercices = ['Exercise 1', 'Exercise 2', 'Exercise 3'];
  @override
  State<TrainingPlan> createState() => _TrainingPlanState();
}

class _TrainingPlanState extends State<TrainingPlan> {
  /*late List<bool>
      exerciseToggleValues; // late means it is used when it is required or initialized when it is required

  @override
  void initState() {
    super.initState();
    exerciseToggleValues = List<bool>.filled(widget.exercices.length,
        false); // initialize dynamically with false when the state is created
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.name} Training Plans')),
      body: ListView.builder(
        itemCount: widget.focusPoint.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Perform actions when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DisplayExercise(
                          focusPoints: widget.focusPoint,
                          exercises: widget.exercises)),
                );
              },
              child: Text(widget.focusPoint[index].getName()),
            ),
          );
        },
      ),
    );
  }
}
