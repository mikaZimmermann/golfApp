import 'package:flutter/material.dart';
import 'Importer.dart';
import 'TrainingPlanOverview.dart';
import 'Themes.dart';
import 'UserPage.dart';
import 'User.dart';
import 'SharedPreferencesUser.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Golf Training',
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      home: const MyHomePage(title: 'Golf Training'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _selectedLanguage = 'English';
  String otpButtonText = 'Open Training Plans';

  @override
  void initState() {
    super.initState();
    _selectedLanguage = User.language;
    if (_selectedLanguage == 'German') {
      otpButtonText = 'Offene Trainingspläne';
    } else {
      otpButtonText = 'Open Training Plans';
    }

    getUsername().then((username) {
      getLanguage().then((language) {
        setState(() {
          User.setUsername(username);
          User.setLanguage(language);
        });
      });
    });
  }

  Future<String> getUsername() async {
    String? username = await SharedPreferencesUser.getUsername();
    return username!;
  }

  Future<String> getLanguage() async {
    String? language = await SharedPreferencesUser.getLanguage();
    return language!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(children: <Widget>[
        Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ElevatedButton(
                child: Text(otpButtonText),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TrainingPlanOverview(
                              trainingPlans: Importer.trainingPlans,
                              beginnerfocusPoints: Importer.beginnerFP,
                              interfocusPoints: Importer.interFP,
                              advancedfocusPoints: Importer.advFP,
                              realExercise: Importer.realExercises,
                            )),
                  );
                })),
        Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ElevatedButton(
                child: const Icon(Icons.settings),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UserPage()),
                  );
                }))
      ])),
    );
  } //build
} //class
