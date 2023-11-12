import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'dart:math';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

// ignore: non_constant_identifier_names
class _DiceRollerState extends State<DiceRoller> {
  var imageToDisplay = 'assets/pictures/dice-7.png';



  startOver() {
    setState(() {
      imageToDisplay = 'assets/pictures/dice-7.png';
    });
  }

  rollDice() {
    var randomNumber = 7; // Random Number is between 1 and 6

    setState(() {
      var randomNumber =
          Random().nextInt(6) + 1; // Random Number is between 1 and 6
      //imageToDisplay = 'assets/pictures/dice-4.png';
      imageToDisplay = 'assets/pictures/dice-$randomNumber.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Rollin Dice', style: TextStyle(color: Colors.blueAccent, fontSize: 50),textAlign: TextAlign.center,),
        Image.asset(
          imageToDisplay,
          width: 250,
          height: 250,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: startOver,
              style: TextButton.styleFrom(
                backgroundColor: Colors.lime,
                foregroundColor: const Color.fromARGB(255, 181, 7, 7),
                padding: const EdgeInsets.all(16.0),
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text("Start Over"),
            ),
            const SizedBox(
              width: 30,
            ),
            ElevatedButton(
              onPressed: rollDice,
              style: TextButton.styleFrom(
                backgroundColor: Colors.lime,
                foregroundColor: Color.fromARGB(255, 0, 107, 82),
                padding: const EdgeInsets.all(16.0),
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text("Roll the Dice"),
            ),
          ],
        )
      ],
    );
  }
}
