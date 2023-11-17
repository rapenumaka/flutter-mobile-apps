import 'package:flutter/material.dart';
import 'package:quizapp/answer-button.dart';
import 'package:quizapp/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  
  QuestionScreen({super.key, required this.addToMarksAnswersList});

  void Function(String answer) addToMarksAnswersList;

  @override
  State<QuestionScreen> createState() {
    return _QuestionState();
  }
}

class _QuestionState extends State<QuestionScreen> {
  var currentNumber = 0;

  void onTapped(String selectedAnswer) {
    widget.addToMarksAnswersList(selectedAnswer);
    setState(() {
      currentNumber++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentNumber];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.test,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            ...currentQuestion.getShuffledAnswers().map((ans) {
              return AnswerButton(
                  label: ans,
                  onPress: () {
                    onTapped(ans);
                  });
            }),
          ],
        ),
      ),
    );
  }
}
