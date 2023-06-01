import 'package:flutter/material.dart';

import 'Shottype.dart';

class TrainingPlan extends StatefulWidget {
  TrainingPlan({super.key, required this.name, required this.elements});
  final String name; 
  final List<Shottype> elements;
  

  @override
  State<TrainingPlan> createState() => _TrainingPlanState();
}

class _TrainingPlanState extends State<TrainingPlan> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}