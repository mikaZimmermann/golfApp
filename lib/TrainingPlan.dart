import 'package:flutter/material.dart';

//import 'Shottype.dart';

class TrainingPlan extends StatefulWidget {
  TrainingPlan({super.key, required this.name /*, required this.elements*/});
  final String name;
  //final List<Shottype> elements;
  // bool hit_or_miss = false;
  List<String> exercices = ['Exercise 1', 'Exercise 2', 'Exercise 3'];
  @override
  State<TrainingPlan> createState() => _TrainingPlanState();
}

class _TrainingPlanState extends State<TrainingPlan> {
  late List<bool>
      exerciseToggleValues; // late means it is used when it is required or initialized when it is required

  @override
  void initState() {
    super.initState();
    exerciseToggleValues = List<bool>.filled(widget.exercices.length,
        false); // initialize dynamically with false when the state is created
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('This is for ${widget.name}')),
      body: ListView.builder(
        itemCount: widget.exercices.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(widget.exercices[index]),
            trailing: Switch(
              value: exerciseToggleValues[index],
              onChanged: (bool newValue) {
                setState(() {
                  exerciseToggleValues[index] = newValue;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
