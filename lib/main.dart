import 'package:flutter/material.dart';
//import 'package:version1/Shottype.dart';
//import 'FocusPoint.dart';
import 'Importer.dart';
import 'TrainingPlanOverview.dart';
import 'Themes.dart';
//import 'Exercise.dart';
//import 'ExerciseDescription.dart';

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
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      home: const MyHomePage(title: 'Golf Training'),
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

  @override
  Widget build(BuildContext context) {
    // have to initialize the exercise list here because it cannot access the focuspoint lists in the scope above
    final Importer importer = Importer();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(children: <Widget>[
        Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ElevatedButton(
                child: const Text('Open Trainingplans'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TrainingPlanOverview(
                              trainingPlans: importer.trainingPlans,
                              beginnerfocusPoints: importer.beginnerFP,
                              interfocusPoints: importer.interFP,
                              advancedfocusPoints: importer.advFP,
                              realExercise: importer.realExercises,
                            )),
                  );
                })),
        Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ElevatedButton(
                child: const Text("Open Settings"), onPressed: () {}))
      ])),
    );
  } //build
} //class
