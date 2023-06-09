import 'package:flutter/material.dart';
import 'package:version1/Exercise.dart';
//import 'package:version1/Shottype.dart';

//import 'ExecutionRecord.dart';
import 'FocusPoint.dart';
import 'ExecuteExercise.dart';

class DisplayExercise extends StatefulWidget {
  const DisplayExercise(
      {super.key, required this.focusPoints, required this.exercises
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercises'),
      ),
      body: ListView.builder(
        itemCount: widget.exercises.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(widget.exercises[index].getDesc().name),
            trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ExecuteExercise(exercise: widget.exercises[index])),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent),
                child: const Text('Start')),
          );
        },
      ),
    );
  }
}
