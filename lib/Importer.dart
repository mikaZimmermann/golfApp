import 'Exercise.dart';
import 'ExerciseDescription.dart';
import 'FocusPoint.dart';

class Importer {
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
        contentDE: 'German description of Intermediate 3 FP'),
    const FocusPoint(
        name: 'Intermediate 3',
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
          id: 1,
          desc: ExerciseDescription('Short swing', 'en', 'de', 10, 7, 20, 10),
          focusPoints: _beginnerFP),
      Exercise(
          id: 2,
          desc: ExerciseDescription('Short put', 'en', 'de', 10, 6, 20, 10),
          focusPoints:_beginnerFP),
      Exercise(
          id: 3,
          desc: ExerciseDescription('Bigman ting', 'en', 'de', 10, 8, 25, 5),
          focusPoints: _interFP)
    ];

  List<String> get trainingPlans => _trainingPlans;
  List<FocusPoint> get beginnerFP => _beginnerFP;
  List<FocusPoint> get interFP => _interFP;
  List<FocusPoint> get advFP => _advFP;
  List<Exercise> get realExercises => _realExercises;
}