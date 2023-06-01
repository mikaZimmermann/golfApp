import 'package:flutter/material.dart';

import 'TrainingPlanOverview.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Golf Training Build with github actions'),
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
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Color.fromARGB(255, 200, 3, 158),
        title: Text(widget.title),
      
      ),
      body: 
      Center(
        child: Column(
      
        children:<Widget>[ 
         Expanded( 
          child: 
            ElevatedButton(
            child: const Text('Open Trainingplans'),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TrainingPlanOverview()),
              
            );
          }
        )),
        Expanded(
          child: ElevatedButton(child: const Text ("Open Settings"),onPressed:(){})
        )
        ]
    
      )),
    );
  } //build
} //class
