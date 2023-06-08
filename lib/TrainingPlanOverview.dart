import 'package:flutter/material.dart';
import 'package:version1/TrainingPlan.dart';
import 'FocusPoint.dart';

class TrainingPlanOverview extends StatefulWidget {
  TrainingPlanOverview(
      {super.key,
      required this.trainingPlans,
      required this.beginnerfocusPoints,
      required this.interfocusPoints,
      required this.advancedfocusPoints});

  final List<String> trainingPlans; //= ['P1', 'P2', 'P3'];
  final List<FocusPoint> beginnerfocusPoints;
  final List<FocusPoint> interfocusPoints;
  final List<FocusPoint> advancedfocusPoints;
  @override
  State<TrainingPlanOverview> createState() => _TrainingPlanOverview();
}

class _TrainingPlanOverview extends State<TrainingPlanOverview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Training Plans Overview'),
      ),
      body: ListView.builder(
        itemCount: widget.trainingPlans.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Perform actions when the button is pressed
                if (widget.trainingPlans[index] == 'Beginner') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TrainingPlan(
                            name: widget.trainingPlans[index],
                            focusPoint: widget.beginnerfocusPoints)),
                  );
                } else if (widget.trainingPlans[index] == 'Intermediate') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TrainingPlan(
                            name: widget.trainingPlans[index],
                            focusPoint: widget.interfocusPoints)),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TrainingPlan(
                            name: widget.trainingPlans[index],
                            focusPoint: widget.advancedfocusPoints)),
                  );
                }
                print('Button pressed for ${widget.trainingPlans[index]}');
              },
              child: Text(widget.trainingPlans[index]),
            ),
          );
        },
      ),
    );
  }
}
