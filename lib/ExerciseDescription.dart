import 'package:flutter/material.dart';

class ExerciseDescription {
  ExerciseDescription(this.name, this.Illustration, this.content,
      this.repetitions, this.passingThreshold);

  final String name;
  final Image Illustration;
  final List<String> content;
  final int repetitions;
  final String passingThreshold;
}
