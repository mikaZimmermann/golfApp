import 'package:flutter/material.dart';
import 'package:version1/Exercise.dart';

class DisplayExerciseProgress extends StatefulWidget {
  const DisplayExerciseProgress({super.key, required this.exercise});
  final Exercise exercise;
  @override
  State<DisplayExerciseProgress> createState() => _DExerciseState();
}

class _DExerciseState extends State<DisplayExerciseProgress> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exercise.desc.name),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Name: ${widget.exercise.desc.name}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Description (English): ${widget.exercise.desc.contentEN}',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            'Description (German): ${widget.exercise.desc.contentDE}',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            'Repetitions: ${widget.exercise.desc.repetitions}',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            'Passing Repetitions: ${widget.exercise.desc.passingThreshold}',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          const Text(
            'Records:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.exercise.records.length,
            itemBuilder: (BuildContext context, int index) {
              final record = widget.exercise.records[index];
              return Card(
                child: ListTile(
                  title: Text('Date: ${record.dateTime}'),
                  subtitle: Text(
                    'Shots Made: ${record.shotsMade} / Total Repetitions: ${record.repetitions}',
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
