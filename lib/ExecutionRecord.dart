class ExecutionRecord {
  ExecutionRecord({required this.exerciseID});
  int exerciseID;
  late int repetitions = 0;
  late int shotsMade = 0;
  late DateTime dateTime = DateTime.now();
  late String grade = '';

  int getExerciseID() => exerciseID;
  int getRepititions() => repetitions;
  int getShotsMade() => shotsMade;
  DateTime getDateTime() => dateTime;
  String getGrade() => grade;

  void setRepitions(int reps) {
    repetitions = reps;
  }

  void setShotsMade(int shots) {
    shotsMade = shots;
  }

  void setDateTime(DateTime dt) {
    dateTime = dt;
  }

  void setGrade(String grd) {
    grade = grd;
  }
}
