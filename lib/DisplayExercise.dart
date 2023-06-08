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
  @override
  State<DisplayExercise> createState() => _DExerciseState();
}

class _DExerciseState extends State<DisplayExercise> {
  late List<bool> exerciseToggleValues;
  bool showToggles = false;
  bool trainingPlanStarted =
      false; // Flag to track if training plan has started

  @override
  void initState() {
    super.initState();
    exerciseToggleValues = List<bool>.filled(widget.exercises.length, false);
  }

  void startTrainingPlan() {
    setState(() {
      showToggles = true;
      trainingPlanStarted = true;
    });
  }

  void stopTrainingPlan() {
    setState(() {
      showToggles = false;
      trainingPlanStarted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercises'),
        actions: [
          if (!trainingPlanStarted) // Show "Start Exercise Plan" button if plan not started
            ElevatedButton(
              onPressed: startTrainingPlan,
              child: Text(
                'Start',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 23, 82, 25)),
            ),
          if (trainingPlanStarted) // Show "Stop" button if plan started
            ElevatedButton(
              onPressed: stopTrainingPlan,
              child: Text(
                'Stop',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 121, 19, 12)),
            ),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.exercises.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(widget.exercises[index].getDesc().name),
            trailing: showToggles &&
                    trainingPlanStarted // Conditionally show toggles based on flags
                ? Switch(
                    value: exerciseToggleValues[index],
                    onChanged: (bool newValue) {
                      setState(() {
                        exerciseToggleValues[index] = newValue;
                      });
                    },
                  )
                : null,
          );
        },
      ),
    );
  }
}
