import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton( {
    super.key,
    required this.label, 
    required this.onPress});

  final String label;
  final void Function() onPress;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        ElevatedButton(
          onPressed: onPress, 
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 80
            ),
            backgroundColor: const Color.fromARGB(255,33 , 1, 95),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))
          ),
          child: Text(label),
          ),
      ],
    );
  }
  
 


}

