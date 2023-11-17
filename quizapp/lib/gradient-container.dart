import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(Object context) {
    String headline1 = 'Learn Flutter the fun way!';

    final ButtonStyle buttonstyle =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/quiz-logo.png',
              width: 250, height: 250, fit: BoxFit.cover),
          const SizedBox(
            height: 45,
          ),
          Text(
            headline1,
            style: const TextStyle(fontSize: 25, color: Colors.white38),
          ),
          const SizedBox(
            height: 45,
          ),
          ElevatedButton(
            style: buttonstyle,
            onPressed: () {
              switchScreen();
            },
            child: const Text('Start Quiz'),
          ),
          const SizedBox(
            height: 45,
          ),
          OutlinedButton.icon(
            onPressed: switchScreen,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text("Second Button"),
          )
        ],
      ),
    );
  }
}

// Avoid Opacity as widget