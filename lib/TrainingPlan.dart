import 'package:flutter/material.dart';
import 'package:version1/Exercise.dart';
//import 'package:version1/Exercise.dart';
import 'DisplayExercise.dart';

import 'FocusPoint.dart';

class TrainingPlan extends StatefulWidget {
  const TrainingPlan(
      {super.key,
      required this.name,
      required this.focusPoint,
      required this.exercises});
  final String name;
  final List<FocusPoint> focusPoint;
  final List<Exercise> exercises;
  @override
  State<TrainingPlan> createState() => _TrainingPlanState();
}

class _TrainingPlanState extends State<TrainingPlan> {
  @override
  void initState() {
    super.initState();
  }

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
