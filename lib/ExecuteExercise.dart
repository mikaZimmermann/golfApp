import 'package:flutter/material.dart';
import 'package:version1/Exercise.dart';

class ExecuteExercise extends StatefulWidget {
  const ExecuteExercise({super.key, required this.exercise});
  final Exercise exercise;
  @override
  State<ExecuteExercise> createState() => _ExerciseState();
}

class _ExerciseState extends State<ExecuteExercise> {
  int repcount = 0;
  int shotsmade = 0;

  @override
  void initState() {
    super.initState();
    repcount = widget.exercise.desc.repetitions;
  }

  void incrementCount() {
    setState(() {
      shotsmade++;
      repcount--;
    });
  }

  void decrementCount() {
    setState(() {
      repcount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Executing ${widget.exercise.desc.name}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$shotsmade Hits and',
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(width: 8),
                Text(
                  '$repcount Reps lefts',
                  style: const TextStyle(fontSize: 24),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: repcount > 0 ? incrementCount : null,
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Icon(Icons.check),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: repcount > 0 ? decrementCount : null,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Icon(Icons.clear_rounded),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('End Exercise'),
            ),
          ],
        ),
      ),
    );
  }
}
