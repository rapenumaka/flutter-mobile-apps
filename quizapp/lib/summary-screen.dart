import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizapp/data/questions.dart';

class SummaryScreen extends StatelessWidget{


  final List<Map<String,Object>> summaryData;

  const SummaryScreen({super.key, required this.summaryData});
  @override
  Widget build(Object context) {
   
   return SizedBox(
    height: 300,
     child: SingleChildScrollView(
       child: Container(
         child: Column(
          children: summaryData.map(
            (data) {
            return Row(children: [
              Text((data['question-number'] as int).toString(),
              style: const TextStyle( 
                      fontSize: 20,
                      color: Color.fromARGB(189, 110, 255, 7)   
                     )),
              const SizedBox(width: 10,),
                Expanded(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data['question'] as String, 
                     overflow: TextOverflow.ellipsis,
                     maxLines: 3,
                    softWrap: false,
                    style: const TextStyle( 
                      fontSize: 15,
                      color: Color.fromARGB(255, 21, 13, 13)   
                     ),),
                   const SizedBox(height: 5,),
                   Text(data['correct-answer'] as String,
                     style: const TextStyle( 
                      fontSize: 12,
                      color: Color.fromARGB(255, 255, 192, 65)   
                     )
                   ),
                   const SizedBox(height: 5,),
                  Text(data['selected-answer'] as String,
                   style: const TextStyle( 
                      fontSize: 12,
                      color: Color.fromARGB(190, 11, 7, 255)   
                     )
                  ),
                   const SizedBox(height: 10,)
                  ],
                   
                          ),
                )
            ],);
          }
          ).toList(),
         ),
       ),
     ),
   );
  }

}