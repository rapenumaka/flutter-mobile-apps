class QuizQuestion {
  const QuizQuestion(this.test, this.answers);

  final String test;
  final List<String> answers;

  List<String> getShuffledAnswers() {
   List<String> shuffledAnswers = List.of(answers);
    shuffledAnswers.shuffle();
    return List.of(shuffledAnswers);
  }
}
