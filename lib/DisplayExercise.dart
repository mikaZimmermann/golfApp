import 'package:flutter/material.dart';
import 'package:version1/Exercise.dart';
import 'FocusPoint.dart';
import 'ExecuteExercise.dart';
import 'DisplayExerciseProgress.dart';

class DisplayExercise extends StatefulWidget {
  const DisplayExercise(
      {super.key, required this.focusPoints, required this.exercises});
  final List<FocusPoint> focusPoints;
  final List<Exercise> exercises;
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
            title: Row(
              children: [
                Text(widget.exercises[index].getDesc().name),
                const SizedBox(width: 8),
                PopupMenuButton(
                  icon: const Icon(Icons.more_vert),
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(
                        child: const Text('Preview Exercise'),
                        onTap: () {
                          // display exercise description and the record of the user's performance on that exercise
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DisplayExerciseProgress(
                                  exercise: widget.exercises[index]),
                            ),
                          );
                          print('Button pressed');
                        },
                      ),
                    ];
                  },
                ),
              ],
            ),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ExecuteExercise(exercise: widget.exercises[index]),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                elevation: 0,
              ),
              child: const Icon(Icons.play_arrow_outlined),
            ),
          );
        },
      ),
    );
  }
}
