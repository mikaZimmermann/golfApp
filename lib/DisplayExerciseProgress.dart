import 'package:flutter/material.dart';
import 'package:version1/Exercise.dart';
import 'ExecutionRecord.dart';

class DisplayExerciseProgress extends StatefulWidget {
  const DisplayExerciseProgress({Key? key, required this.exercise})
      : super(key: key);
  final Exercise exercise;

  @override
  State<DisplayExerciseProgress> createState() => _DExerciseState();
}

class _DExerciseState extends State<DisplayExerciseProgress> {
  List<ExecutionRecord> records = [];
  @override
  void initState() {
    super.initState();
    records = widget.exercise.records;
    if (records.isNotEmpty && records[0].repetitions == 0) {
      records.removeAt(0);
    }
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
            'Passing Threshold: ${widget.exercise.desc.passingThreshold}',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            'Distance from Flag: ${widget.exercise.desc.distanceToFlag} meters',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            'Goal Area: ${widget.exercise.desc.goalArea} meters',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          const Text(
            'Your Progress:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: records.length,
            itemBuilder: (BuildContext context, int index) {
              final record = records[index];
              Color cardColor;

              if (record.grade == 'Pass') {
                cardColor = const Color.fromARGB(255, 47, 117, 50);
              } else if (record.grade == 'Fail') {
                cardColor = const Color.fromARGB(255, 124, 24, 17);
              } else {
                cardColor = Colors.transparent;
              }
              return Card(
                color: cardColor,
                child: ListTile(
                  title: Text(
                    'Status: ${record.grade}   ${record.shotsMade}/${record.repetitions}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Date: ${record.dateTime}',
                    style: const TextStyle(color: Colors.white),
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
