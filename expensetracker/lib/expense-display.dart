import 'package:expensetracker/expense-card.dart';
import 'package:expensetracker/model/expense_model.dart';
import 'package:flutter/widgets.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key, required this.requiredExpenseList, required this.onRemoveExpense});

  final Function(Expense expense) onRemoveExpense;

  final List<Expense> requiredExpenseList;
  @override
  Widget build(Object context) {

    return ListView.builder(
      itemCount: requiredExpenseList.length,
      itemBuilder: ( context, index) =>
       Dismissible(
        onDismissed:  (direction){
          onRemoveExpense(requiredExpenseList[index]);
        },
        key: ValueKey(requiredExpenseList[index]),
        child: ExpenseCard(requiredExpenseList[index]))
    );
  }
}
