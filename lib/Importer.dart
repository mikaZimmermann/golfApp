import 'Exercise.dart';
import 'ExerciseDescription.dart';
import 'FocusPoint.dart';
import 'ExecutionRecord.dart';
//import 'User.dart';

class Importer {
  //static List<User> _users = [];

  final List<FocusPoint> _beginnerFP = [
    const FocusPoint(
        name: 'Putting',
        difficulty: 'Beginner',
        contentEN: 'English description of Beginner 1 FP',
        contentDE: 'German description of Beginner 1 FP'),
    const FocusPoint(
        name: 'Short Game',
        difficulty: 'Beginner',
        contentEN: 'English description of Beginner 2 FP',
        contentDE: 'German description of Beginner 3 FP'),
    const FocusPoint(
        name: 'Long Game',
        difficulty: 'Beginner',
        contentEN: 'English description of Beginner 3 FP',
        contentDE: 'German description of Beginner 3 FP')
  ];
  //there are three different focuspoint lists depending on the difficulty,
  // this is similar to what was a category, we can seperate the two later if required
  final List<FocusPoint> _interFP = [
    const FocusPoint(
        name: 'Intermediate 1',
        difficulty: 'Intermediate',
        contentEN: 'English description of Intermediate 1 FP',
        contentDE: 'German description of Intermediate 1 FP'),
    const FocusPoint(
        name: 'Intermediate 2',
        difficulty: 'Intermediate',
        contentEN: 'English description of Intermediate 2 FP',
        contentDE: 'German description of Intermediate 2 FP'),
    const FocusPoint(
        name: 'Intermediate 3',
        difficulty: 'Intermediate',
        contentEN: 'English description of Intermediate 2 FP',
        contentDE: 'German description of Intermediate 3 FP'),
    const FocusPoint(
        name: 'Intermediate 4',
        difficulty: 'Intermediate',
        contentEN: 'English description of Intermediate 2 FP',
        contentDE: 'German description of Intermediate 3 FP'),
    const FocusPoint(
        name: 'Intermediate 5',
        difficulty: 'Intermediate',
        contentEN: 'English description of Intermediate 2 FP',
        contentDE: 'German description of Intermediate 3 FP'),
    const FocusPoint(
        name: 'Intermediate 6',
        difficulty: 'Intermediate',
        contentEN: 'English description of Intermediate 2 FP',
        contentDE: 'German description of Intermediate 3 FP'),
    const FocusPoint(
        name: 'Intermediate 7',
        difficulty: 'Intermediate',
        contentEN: 'English description of Intermediate 2 FP',
        contentDE: 'German description of Intermediate 3 FP'),
    const FocusPoint(
        name: 'Intermediate 8',
        difficulty: 'Intermediate',
        contentEN: 'English description of Intermediate 2 FP',
        contentDE: 'German description of Intermediate 3 FP'),
    const FocusPoint(
        name: 'Intermediate 9',
        difficulty: 'Intermediate',
        contentEN: 'English description of Intermediate 2 FP',
        contentDE: 'German description of Intermediate 3 FP'),
    const FocusPoint(
        name: 'Intermediate 10',
        difficulty: 'Intermediate',
        contentEN: 'English description of Intermediate 2 FP',
        contentDE: 'German description of Intermediate 3 FP'),
    const FocusPoint(
        name: 'Intermediate 11',
        difficulty: 'Intermediate',
        contentEN: 'English description of Intermediate 2 FP',
        contentDE: 'German description of Intermediate 3 FP'),
    const FocusPoint(
        name: 'Intermediate 12',
        difficulty: 'Intermediate',
        contentEN: 'English description of Intermediate 2 FP',
        contentDE: 'German description of Intermediate 3 FP'),
    const FocusPoint(
        name: 'Intermediate 13',
        difficulty: 'Intermediate',
        contentEN: 'English description of Intermediate 3 FP',
        contentDE: 'German description of Intermediate 3 FP')
  ];

  final List<FocusPoint> _advFP = [
    const FocusPoint(
        name: 'Advanced 1',
        difficulty: 'Advanced',
        contentEN: 'English description of Advanced 1 FP',
        contentDE: 'German description of Advanced 1 FP'),
    const FocusPoint(
        name: 'Advanced 2',
        difficulty: 'Advanced',
        contentEN: 'English description of Advanced 2 FP',
        contentDE: 'German description of Advanced 3 FP'),
    const FocusPoint(
        name: 'Advanced 3',
        difficulty: 'Advanced',
        contentEN: 'English description of Advanced 3 FP',
        contentDE: 'German description of Advanced 3 FP')
  ];

  final List<String> _trainingPlans = [
    'Beginner',
    'Intermediate',
    'Advanced'
  ]; //this list is used to create dynamic buttons,
  // we can add more trainingplans or import from a file

  late final List<Exercise> _realExercises = [
    Exercise(
        ID: 1,
        Desc: ExerciseDescription('Short swing', 'en', 'de', 10, 7, 20, 10),
        FocusPoints: _beginnerFP,
        Records: [ExecutionRecord(ExerciseID: 1)]),
    Exercise(
        ID: 2,
        Desc: ExerciseDescription('Short put', 'en', 'de', 15, 6, 20, 10),
        FocusPoints: _beginnerFP,
        Records: [ExecutionRecord(ExerciseID: 2)]),
    Exercise(
        ID: 3,
        Desc: ExerciseDescription('Bigman ting', 'en', 'de', 10, 8, 25, 5),
        FocusPoints: _interFP,
        Records: [ExecutionRecord(ExerciseID: 3)]),
    Exercise(
        ID: 4,
        Desc: ExerciseDescription('Heavy ting', 'en', 'de', 20, 8, 25, 5),
        FocusPoints: [
          const FocusPoint(
              name: 'Advanced 1',
              difficulty: 'Advanced',
              contentEN: 'English description of Advanced 1 FP',
              contentDE: 'German description of Advanced 1 FP'),
          const FocusPoint(
              name: 'Long Game',
              difficulty: 'Beginner',
              contentEN: 'English description of Beginner 3 FP',
              contentDE: 'German description of Beginner 3 FP'),
          const FocusPoint(
              name: 'Intermediate 13',
              difficulty: 'Intermediate',
              contentEN: 'English description of Intermediate 3 FP',
              contentDE: 'German description of Intermediate 3 FP')
        ],
        Records: [
          ExecutionRecord(ExerciseID: 4)
        ])
  ];

  //List<User> get users => _users;
  List<String> get trainingPlans => _trainingPlans;
  List<FocusPoint> get beginnerFP => _beginnerFP;
  List<FocusPoint> get interFP => _interFP;
  List<FocusPoint> get advFP => _advFP;
  List<Exercise> get realExercises => _realExercises;

  //static void addUser(User u) {
  //_users.add(u);
  //}
}
