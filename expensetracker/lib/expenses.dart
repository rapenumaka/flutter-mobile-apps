import 'package:expensetracker/chart.dart';
import 'package:expensetracker/chart_bar.dart';
import 'package:expensetracker/expense-add.dart';
import 'package:expensetracker/expense-display.dart';
import 'package:expensetracker/model/expense_model.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  // Creating a dummy data

  List<Expense> registeredExpenses = [
    Expense(
        title: 'Movie tickets',
        amount: 30.89,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: 'Costco Gas',
        amount: 45.89,
        date: DateTime.now(),
        category: Category.gas),
    Expense(
        title: 'Bawarchi Biryani',
        amount: 15.00,
        date: DateTime.now(),
        category: Category.food),
  ];

  void displayExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(onAddExpense: _addExpense));
  }

  void _addExpense(Expense expense) {
    setState(() {
      registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = registeredExpenses.indexOf(expense);
    setState(() {
      registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Expense Deleted'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          setState(() {
            registeredExpenses.insert(expenseIndex, expense);
          });
        },
      ),
    ));
  }

  @override
  Widget build(Object context) {
    Widget _showContext = const Center(
      child: Text(' No expenses created, create one '),
    );

    if (registeredExpenses.isNotEmpty) {
      _showContext = ExpenseList(
        requiredExpenseList: registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(actions: [
        const Text('My Expense Tracker'),
        IconButton(
            onPressed: displayExpenseOverlay, icon: const Icon(Icons.add))
      ]),
      body: Column(
        children: [
          const Text('Expenses label'),
          Chart(expenses: registeredExpenses,),
          Expanded(
            child: _showContext,
          )
        ],
      ),
    );
  }
}
