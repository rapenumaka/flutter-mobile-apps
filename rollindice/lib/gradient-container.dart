import 'package:flutter/material.dart';
import 'package:rollindice/dice_roller.dart';

//import 'package:basics/styled_text.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  rolleDice() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.grey, Colors.black],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight),
      ),
      child: const Center(
        child: DiceRoller()
      ),
    );
  }
}
