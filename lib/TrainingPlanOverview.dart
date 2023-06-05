import 'package:flutter/material.dart';

class TrainingPlanOverview extends StatefulWidget {
  const TrainingPlanOverview({super.key});

  @override
  State<TrainingPlanOverview> createState() => _TrainingPlanOverview();
}

class _TrainingPlanOverview extends State<TrainingPlanOverview> {
  final List<String> trainingPlans = ['P1', 'P2', 'P3'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Training Plans Overview'),
      ),
      body: ListView.builder(
        itemCount: trainingPlans.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Perform actions when the button is pressed
                // You can navigate to another page or perform any other logic
                print('Button pressed for ${trainingPlans[index]}');
              },
              child: Text(trainingPlans[index]),
            ),
          );
        },
      ),
    );
  }
}
