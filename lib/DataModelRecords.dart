class DataModelRecords {
  static const String tableNameRecords = 'exercise_records';
  static const String tableNameUsers = 'users';
  static const String columnId = '_id';
  static const String columnExerciseId = 'exercise_id';
  static const String columnRepetitions = 'repetitions';
  static const String columnShotsMade = 'shots_made';
  static const String columnDateTime = 'date_time';
  static const String columnGrade = 'grade';
  static const String columnUserName = 'user_name';
  static const String columnLanguage = 'language';

  int? id;
  int exerciseId;
  int repetitions;
  int shotsMade;
  DateTime dateTime;
  String grade;

  DataModelRecords({
    this.id,
    required this.exerciseId,
    required this.repetitions,
    required this.shotsMade,
    required this.dateTime,
    required this.grade,
  });

  Map<String, dynamic> toMap() {
    return {
      columnId: id,
      columnExerciseId: exerciseId,
      columnRepetitions: repetitions,
      columnShotsMade: shotsMade,
      columnDateTime: dateTime.toIso8601String(),
      columnGrade: grade,
    };
  }

  static DataModelRecords fromMap(Map<String, dynamic> map) {
    return DataModelRecords(
      id: map[columnId],
      exerciseId: map[columnExerciseId],
      repetitions: map[columnRepetitions],
      shotsMade: map[columnShotsMade],
      dateTime: DateTime.parse(map[columnDateTime]),
      grade: map[columnGrade],
    );
  }
}
