import 'package:flutter/material.dart';
//import 'package:version1/Shottype.dart';
import 'FocusPoint.dart';
import 'TrainingPlanOverview.dart';

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
  final List<FocusPoint> beginnerFP = [
    FocusPoint(
        name: 'Putting',
        difficulty: 'Beginner',
        contentEN: 'English description of Beginner 1 FP',
        contentDE: 'German description of Beginner 1 FP'),
    FocusPoint(
        name: 'Short Game',
        difficulty: 'Beginner',
        contentEN: 'English description of Beginner 2 FP',
        contentDE: 'German description of Beginner 3 FP'),
    FocusPoint(
        name: 'Long Game',
        difficulty: 'Beginner',
        contentEN: 'English description of Beginner 3 FP',
        contentDE: 'German description of Beginner 3 FP')
  ];

  final List<FocusPoint> interFP = [
    FocusPoint(
        name: 'Intermediate 1',
        difficulty: 'Intermediate',
        contentEN: 'English description of Intermediate 1 FP',
        contentDE: 'German description of Intermediate 1 FP'),
    FocusPoint(
        name: 'Intermediate 2',
        difficulty: 'Intermediate',
        contentEN: 'English description of Intermediate 2 FP',
        contentDE: 'German description of Intermediate 3 FP'),
    FocusPoint(
        name: 'Intermediate 3',
        difficulty: 'Intermediate',
        contentEN: 'English description of Intermediate 3 FP',
        contentDE: 'German description of Intermediate 3 FP')
  ];

  final List<FocusPoint> advFP = [
    FocusPoint(
        name: 'Advanced 1',
        difficulty: 'Advanced',
        contentEN: 'English description of Advanced 1 FP',
        contentDE: 'German description of Advanced 1 FP'),
    FocusPoint(
        name: 'Advanced 2',
        difficulty: 'Advanced',
        contentEN: 'English description of Advanced 2 FP',
        contentDE: 'German description of Advanced 3 FP'),
    FocusPoint(
        name: 'Advanced 3',
        difficulty: 'Advanced',
        contentEN: 'English description of Advanced 3 FP',
        contentDE: 'German description of Advanced 3 FP')
  ];

  final List<String> trainingPlans = ['Beginner', 'Intermediate', 'Advanced'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 75, 41, 138),
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(children: <Widget>[
        Expanded(
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
                            advancedfocusPoints: advFP)),
                  );
                })),
        Expanded(
            child: ElevatedButton(
                child: const Text("Open Settings"), onPressed: () {}))
      ])),
    );
  } //build
} //class
