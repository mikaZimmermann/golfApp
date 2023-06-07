class ExecutionRecord {
  ExecutionRecord({required this.exerciseID});
  int exerciseID;
  late int repetitions;
  late int shotsMade;
  late DateTime dateTime;

  int getExerciseID() => exerciseID;
  int getRepititions() => repetitions;
  int getShotsMade() => shotsMade;
  DateTime getDateTime() => dateTime;
}
