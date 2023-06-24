import 'package:flutter/material.dart';
import 'package:version1/Importer.dart';
import 'package:version1/TrainingPlan.dart';
import 'FocusPoint.dart';
import 'Exercise.dart';
import 'User.dart';
import 'DataModelRecords.dart';
import 'DataModelGlobal.dart';
import 'ExecutionRecord.dart';

class TrainingPlanOverview extends StatefulWidget {
  const TrainingPlanOverview(
      {super.key,
      required this.trainingPlans,
      required this.beginnerfocusPoints,
      required this.interfocusPoints,
      required this.advancedfocusPoints,
      required this.realExercise});

  final List<String> trainingPlans; //getting all the imported data from main
  final List<FocusPoint> beginnerfocusPoints;
  final List<FocusPoint> interfocusPoints;
  final List<FocusPoint> advancedfocusPoints;
  final List<Exercise> realExercise;
  @override
  State<TrainingPlanOverview> createState() => _TrainingPlanOverview();
}

class _TrainingPlanOverview extends State<TrainingPlanOverview> {
  String _selectedLanguage = 'English';
  String title = 'Training Plans Overview';
  late List<DataModelRecords> recordsFromDB;

  @override
  void initState() {
    super.initState();
    _selectedLanguage = User.language;
    refreshExerciseList();
    if (_selectedLanguage == 'German') {
      title = 'Übersicht über die Trainingspläne';
    } else {
      title = 'Training Plans Overview';
    }
  }

  Future<void> refreshExerciseList() async {
    recordsFromDB = await DataModelGlobal.instance.readAllRecords();

    // Clear existing records in exercises
    for (var exercise in widget.realExercise) {
      exercise.records.clear();
    }

    // Add records to exercises
    for (var record in recordsFromDB) {
      // Find the exercise with matching exercise ID
      var exercise = widget.realExercise.firstWhere(
        (exercise) => exercise.id == record.exerciseId,
      );
      ExecutionRecord progress = ExecutionRecord(ExerciseID: exercise.id);
      progress.repetitions = record.repetitions;
      progress.shotsMade = record.shotsMade;
      progress.dateTime = record.dateTime;
      progress.grade = record.grade;
      exercise.records.add(progress);
    }

    Importer.realExercise = widget.realExercise;
  }

  @override
  Widget build(BuildContext context) {
    //dynamic buttons on the number of training plans are created here
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: widget.trainingPlans.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Event handler
                // Depending on the focus point selected we push the required data to the traingPlan constructor
                if (widget.trainingPlans[index] == 'Beginner') {
                  List<Exercise> filteredExercises = [];
                  for (var exercise in widget.realExercise) {
                    bool hasMatchingDifficulty = exercise.focusPoints.any(
                        (focusPoint) => focusPoint.difficulty == 'Beginner');
                    if (hasMatchingDifficulty) {
                      filteredExercises.add(exercise);
                    }
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TrainingPlan(
                            name: widget.trainingPlans[index],
                            focusPoint: widget.beginnerfocusPoints,
                            exercises: filteredExercises)),
                  );
                } else if (widget.trainingPlans[index] == 'Intermediate') {
                  List<Exercise> filteredExercises = [];
                  for (var exercise in widget.realExercise) {
                    bool hasMatchingDifficulty = exercise.focusPoints.any(
                        (focusPoint) =>
                            focusPoint.difficulty == 'Intermediate');
                    if (hasMatchingDifficulty) {
                      filteredExercises.add(exercise);
                    }
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TrainingPlan(
                            name: widget.trainingPlans[index],
                            focusPoint: widget.interfocusPoints,
                            exercises: filteredExercises)),
                  );
                } else {
                  List<Exercise> filteredExercises = [];
                  for (var exercise in widget.realExercise) {
                    bool hasMatchingDifficulty = exercise.focusPoints.any(
                        (focusPoint) => focusPoint.difficulty == 'Advanced');
                    if (hasMatchingDifficulty) {
                      filteredExercises.add(exercise);
                    }
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TrainingPlan(
                            name: widget.trainingPlans[index],
                            focusPoint: widget.advancedfocusPoints,
                            exercises: filteredExercises)),
                  );
                }
              },
              child: Text(widget.trainingPlans[index]),
            ),
          );
        },
      ),
    );
  }
}
