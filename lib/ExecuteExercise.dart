import 'package:flutter/material.dart';
import 'package:version1/DataModelRecords.dart';
import 'package:version1/ExecutionRecord.dart';
import 'package:version1/Exercise.dart';
import 'DataModelGlobal.dart';
import 'Importer.dart';

class ExecuteExercise extends StatefulWidget {
  const ExecuteExercise({super.key, required this.exercise});
  final Exercise exercise;
  @override
  State<ExecuteExercise> createState() => _ExerciseState();
}

class _ExerciseState extends State<ExecuteExercise> {
  int repcountdisplay = 0;
  int repcount = 0;
  int shotsmade = 0;
  int passingthreshold = 0;
  String message1 = ' ';
  String message2 = ' ';
  int databaseRecordid =
      0; // using this as the primary key id whenever a new record is added

  @override
  void initState() {
    super.initState();
    passingthreshold = widget.exercise.desc.passingThreshold;
    repcount = widget.exercise.desc.repetitions;
    repcountdisplay = widget.exercise.desc.repetitions;
    databaseRecordid =
        getLengthofallRecords(); //here currently there is an error where there is already 1 entry in the database at id 1 so a duplicate is causing an exception
  }

  int getLengthofallRecords() {
    int length = 0;
    for (Exercise exercise in Importer.realExercises) {
      length += exercise.records.length;
    }
    return length;
  }

  void incrementCount() {
    setState(() {
      shotsmade++;
      repcountdisplay--;
    });
  }

  void decrementCount() {
    setState(() {
      repcountdisplay--;
    });
  }

  Future addRecordToDB(DataModelRecords dataModelRecords) async {
    await DataModelGlobal.instance.create(dataModelRecords);
  }

  void endExerciseDefinite() {
    setState(() {
      if (shotsmade >= passingthreshold) {
        message1 = 'Exercise Passed';
        message2 = 'Great Work';
        ExecutionRecord progress =
            ExecutionRecord(ExerciseID: widget.exercise.id);
        progress.repetitions = repcount;
        progress.shotsMade = shotsmade;
        progress.dateTime = (DateTime.now());
        progress.grade = 'Pass';
        widget.exercise.records.add(progress);
        DataModelRecords dataModelRecords = DataModelRecords(
            id: databaseRecordid++,
            exerciseId: progress.exerciseID,
            repetitions: progress.repetitions,
            shotsMade: progress.shotsMade,
            dateTime: progress.dateTime,
            grade: progress.grade);
        addRecordToDB(dataModelRecords);
        /* // Store the progress record in the database
        databaseHelper.insertExerciseRecord(dataModelRecords).then((recordId) {
          // Insertion completed success
        }).catchError((error) {
          // Handle any errors that occur during insertion
          print('Error inserting exercise record: $error');
        });*/
      } else {
        message1 = 'Exercise Failed';
        message2 = 'Try Again';
        ExecutionRecord progress =
            ExecutionRecord(ExerciseID: widget.exercise.id);
        progress.repetitions = repcount;
        progress.shotsMade = shotsmade;
        progress.dateTime = (DateTime.now());
        progress.grade = 'Fail';
        widget.exercise.records.add(progress);
        DataModelRecords dataModelRecords = DataModelRecords(
            id: databaseRecordid++,
            exerciseId: progress.exerciseID,
            repetitions: progress.repetitions,
            shotsMade: progress.shotsMade,
            dateTime: progress.dateTime,
            grade: progress.grade);
        addRecordToDB(dataModelRecords);

        /*   // Store the progress record in the database
        databaseHelper.insertExerciseRecord(dataModelRecords).then((recordId) {
          // Insertion completed success
        }).catchError((error) {
          // Handle any errors that occur during insertion
          print('Error inserting exercise record: $error');
        });*/
      }
    });
  }

  Future<bool> _onWillPop() async {
    if (repcountdisplay > 0) {
      // If there are reps left, show a confirmation dialog
      return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Are you sure you want to end?'),
            content: const Text(
                'If you end the Exercise during Execution your progress will be lost'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(
                      context, true); // Return true to allow popping the route
                },
                child: const Text('Yes'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context,
                      false); // Return false to prevent popping the route
                },
                child: const Text('No'),
              ),
            ],
          );
        },
      );
    } else {
      // No reps left, no confirmation dialog needed
      endExerciseDefinite();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(message1),
            content: Text(message2),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                  Navigator.pop(context); // go back to displayExercise
                },
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
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
                      '$repcountdisplay Reps lefts',
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
                      onPressed: repcountdisplay > 0 ? incrementCount : null,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      child: const Icon(Icons.check),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: repcountdisplay > 0 ? decrementCount : null,
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const Icon(Icons.clear_rounded),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    if (repcountdisplay > 0) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Are you sure you want to end?'),
                            content: const Text(
                                'If you end the Exercise during Execution your progress will be lost'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // Close the dialog
                                  Navigator.pop(
                                      context); //go back to displayExercise page
                                },
                                child: const Text('Yes'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // Close the dialog
                                },
                                child: const Text('No'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      endExerciseDefinite();
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(message1),
                            content: Text(message2),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // Close the dialog
                                  Navigator.pop(
                                      context); // go back to displayExercise
                                },
                                child: const Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: const Text('End Exercise'),
                ),
              ],
            ),
          ),
        ));
  }
}
