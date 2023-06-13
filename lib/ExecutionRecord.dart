class ExecutionRecord {
  ExecutionRecord({required int ExerciseID}) : _exerciseID = ExerciseID;
  final int _exerciseID;
  late int _repetitions = 0;
  late int _shotsMade = 0;
  late DateTime _dateTime = DateTime.now();
  late String _grade = '';

  int get exerciseID => _exerciseID;
  int get repetitions => _repetitions;
  int get shotsMade => _shotsMade;
  DateTime get dateTime => _dateTime;
  String get grade => _grade;

  set repetitions(int reps) {
    _repetitions = reps;
  }

  set shotsMade(int shots) {
    _shotsMade = shots;
  }

  set dateTime(DateTime dt) {
    _dateTime = dt;
  }

  set grade(String grd) {
    _grade = grd;
  }
}
