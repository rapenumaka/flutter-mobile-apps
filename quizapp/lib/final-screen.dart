import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/summary-screen.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key,
      required this.goBackScreen,
      required this.answersSelectedList});

  final void Function() goBackScreen;

  final List<String> answersSelectedList;

  List<Map<String, Object>> fetchSummary() {
    final List<Map<String, Object>> resultsToDisplay = [];
    for (var i = 0; i < answersSelectedList.length; i++) {
      resultsToDisplay.add({
        'question-number': i + 1,
        'question': questions[i].test,
        'correct-answer': questions[i].answers[0],
        'selected-answer': answersSelectedList[i]
      });
    }
    return resultsToDisplay;
  }

  @override
  Widget build(BuildContext context) {
    var correctAnswers = 0;
    List<Map<String, Object>> resultList = fetchSummary();
    resultList.map((data) {
      if (data['correct-answer'] == data['selected-answer']) {
        correctAnswers++;
      }
    });

    var totalQuestions = resultList.length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'You answered $correctAnswers out of $totalQuestions questions correctly !'),
            const SizedBox(
              height: 30,
            ),
            SummaryScreen(summaryData: fetchSummary()),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: goBackScreen, child: const Text('Return'))
          ],
        ),
      ),
    );
  }
}
