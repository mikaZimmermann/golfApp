import 'package:flutter/material.dart';

class TrainingPlanOverview extends StatefulWidget{
  const TrainingPlanOverview({super.key});

  @override
  State<TrainingPlanOverview> createState() => _TrainingPlanOverview();
}

class _TrainingPlanOverview extends State <TrainingPlanOverview>{


  @override Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("This is the Trainingplan overview")
      ),
     
    );

  }
}