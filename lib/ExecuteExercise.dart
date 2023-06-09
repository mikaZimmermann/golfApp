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
      body: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Reps: $repcount',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(width: 8),
          Text(
            'Hits: $shotsmade',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: repcount > 0 ? incrementCount : null,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: const Text(
              'Hit',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: repcount > 0 ? decrementCount : null,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text(
              'Miss',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
