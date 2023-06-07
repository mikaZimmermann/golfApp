import 'package:flutter/material.dart';

class ExerciseDescription {
  ExerciseDescription(this.name, this.illustration, this.content,
      this.repetitions, this.passingThreshold);

  final String name;
  final Image illustration;
  final List<String> content;
  final int repetitions;
  final String passingThreshold;

  String displayDescription(String language) {
    if (language == 'DE') {
      return content[0];
    } else {
      return content[1];
    }
  }
}
