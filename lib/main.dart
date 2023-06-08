import 'package:flutter/material.dart';
//import 'package:version1/Shottype.dart';
import 'FocusPoint.dart';
import 'TrainingPlanOverview.dart';
import 'Exercise.dart';
import 'ExerciseDescription.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Golf Training',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Golf Training Build with github actions'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //I add some lists of focus points here, we can import as many as we like from a file later on
  final List<FocusPoint> beginnerFP = [
    const FocusPoint(
        name: 'Putting',
        difficulty: 'Beginner',
        contentEN: 'English description of Beginner 1 FP',
        contentDE: 'German description of Beginner 1 FP'),
    const FocusPoint(
        name: 'Short Game',
        difficulty: 'Beginner',
        contentEN: 'English description of Beginner 2 FP',
        contentDE: 'German description of Beginner 3 FP'),
    const FocusPoint(
        name: 'Long Game',
        difficulty: 'Beginner',
        contentEN: 'English description of Beginner 3 FP',
        contentDE: 'German description of Beginner 3 FP')
  ];
  //there are three different focuspoint lists depending on the difficulty,
  // this is similar to what was a category, we can seperate the two later if required
  final List<FocusPoint> interFP = [
    const FocusPoint(
        name: 'Intermediate 1',
        difficulty: 'Intermediate',
        contentEN: 'English description of Intermediate 1 FP',
        contentDE: 'German description of Intermediate 1 FP'),
    const FocusPoint(
        name: 'Intermediate 2',
        difficulty: 'Intermediate',
        contentEN: 'English description of Intermediate 2 FP',
        contentDE: 'German description of Intermediate 3 FP'),
    const FocusPoint(
        name: 'Intermediate 3',
        difficulty: 'Intermediate',
        contentEN: 'English description of Intermediate 3 FP',
        contentDE: 'German description of Intermediate 3 FP')
  ];

  final List<FocusPoint> advFP = [
    const FocusPoint(
        name: 'Advanced 1',
        difficulty: 'Advanced',
        contentEN: 'English description of Advanced 1 FP',
        contentDE: 'German description of Advanced 1 FP'),
    const FocusPoint(
        name: 'Advanced 2',
        difficulty: 'Advanced',
        contentEN: 'English description of Advanced 2 FP',
        contentDE: 'German description of Advanced 3 FP'),
    const FocusPoint(
        name: 'Advanced 3',
        difficulty: 'Advanced',
        contentEN: 'English description of Advanced 3 FP',
        contentDE: 'German description of Advanced 3 FP')
  ];

  final List<String> trainingPlans = [
    'Beginner',
    'Intermediate',
    'Advanced'
  ]; //this list is used to create dynamic buttons,
  // we can add more trainingplans or import from a file
  @override
  Widget build(BuildContext context) {
    // have to initialize the exercise list here because it cannot access the focuspoint lists in the scope above
    final List<Exercise> realExercises = [
      Exercise(
          id: 1,
          desc: ExerciseDescription('Short swing', 'en', 'de', 10, 7, 20, 10),
          focusPoints: beginnerFP),
      Exercise(
          id: 2,
          desc: ExerciseDescription('Short put', 'en', 'de', 10, 6, 20, 10),
          focusPoints: beginnerFP),
      Exercise(
          id: 3,
          desc: ExerciseDescription('Bigman ting', 'en', 'de', 10, 8, 25, 5),
          focusPoints: interFP)
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 75, 41, 138),
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(children: <Widget>[
        Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ElevatedButton(
                child: const Text('Open Trainingplans'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TrainingPlanOverview(
                              trainingPlans: trainingPlans,
                              beginnerfocusPoints: beginnerFP,
                              interfocusPoints: interFP,
                              advancedfocusPoints: advFP,
                              realExercise: realExercises,
                            )),
                  );
                })),
        Expanded(
            child: ElevatedButton(
                child: const Text("Open Settings"), onPressed: () {}))
      ])),
    );
  } //build
} //class
