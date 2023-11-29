import 'package:expensetracker/model/expense_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {

  const ExpenseCard(this.expense, {super.key});
  final Expense expense;
  
  String get formattedDate => expense.formattedDate;

  @override
  Widget build(BuildContext context) {
    return Card(child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
        leading : Icon(categoryIcons[expense.category]),
        title: Text(expense.title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.blueAccent )),
       ),
       Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
         Text('\$${expense.amount.toStringAsFixed(2)}',
         style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.deepOrange ),),
         const SizedBox(width: 8),
         Text(formattedDate,
         style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15 ),)

        ],)
    ]),);
  }
}
