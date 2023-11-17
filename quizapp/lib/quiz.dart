import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/final-screen.dart';
import 'package:quizapp/gradient-container.dart';
import 'package:quizapp/questions-screen.dart';

class Quiz extends StatefulWidget {
  Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizStateful();
  }
}

class _QuizStateful extends State<Quiz> {
  Widget? activeScreen; // Adding ? mean the variable activeScreen can be null

  List<String> makedAnswersList = [];

  void addToMarksAnswersList(String answer) {
    print('Executing this method');
    makedAnswersList.add(answer);

    if (makedAnswersList.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(
            goBackScreen: backToStartScreen,
            answersSelectedList: makedAnswersList);
      });
    }
  }

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void backToStartScreen() {
    setState(() {
      makedAnswersList.clear();
      activeScreen = StartScreen(switchScreen);
    });
  }

  void switchScreen() {
    print('******Executing this method****');
    setState(() {
      activeScreen =
          QuestionScreen(addToMarksAnswersList: addToMarksAnswersList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 198, 76, 76),
                Color.fromARGB(255, 54, 47, 47)
              ], begin: Alignment.bottomLeft, end: Alignment.topRight),
            ),
            child: activeScreen),
      ),
    );
  }
}
