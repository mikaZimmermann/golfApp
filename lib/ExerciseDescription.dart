//import 'package:flutter/material.dart';

class ExerciseDescription {
  ExerciseDescription(
      this.name,
      this.contentEN,
      this.contentDE,
      this.repetitions,
      this.passingThreshold,
      this.distanceToFlag,
      this.goalArea);

  final String name;
  //final Image illustration;
  final String contentEN;
  final String contentDE;
  final int repetitions;
  final int passingThreshold;
  final int distanceToFlag;
  final int goalArea;

  String getName() => name;
  String getContentEN() => contentEN;
  String getContentDE() => contentDE;
  int getReps() => repetitions;
  int getPassingThreshold() => passingThreshold;

  /*String displayDescription(String language) {
    if (language == 'DE') {
      return content[0];
    } else {
      return content[1];
    }
  }*/
}
