import 'dart:collection';

import 'package:expensetracker/model/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  String _enteredTitle = '';

  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _amountController = TextEditingController();

  var _selectedCategory = Category.food;

  DateTime selectedDate = DateTime.now();
  final TextEditingController _textEditingController = TextEditingController();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _textEditingController
          ..text = DateFormat.yMMMd().format(selectedDate)
          ..selection = TextSelection.fromPosition(TextPosition(
              offset: _textEditingController.text.length,
              affinity: TextAffinity.upstream));
      });
    }
  }

  void _saveTitle(String inputValue) {
    _enteredTitle = inputValue;
  }

  void _submitExpense() {
    print('Going through the submit expense function ');
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty || amountIsInvalid) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Invalid Input'),
                content: const Text(
                    'Please make sure a valid title, amount anmd date was entered ..'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: const Text('OK'))
                ],
              ));
      return;
    }
    var addedExpense = Expense(
        title: _titleController.text.trim(),
        amount: enteredAmount,
        date: selectedDate,
        category: _selectedCategory);
    widget.onAddExpense(addedExpense);
    return;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            //onChanged: _saveTitle,
            controller: _titleController,
            maxLength: 60,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            //onChanged: _saveTitle,
            controller: _amountController,
            maxLength: 7,
            decoration: const InputDecoration(label: Text('Amount Spent')),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: _textEditingController,
            decoration: const InputDecoration(
                labelText: 'DATE',
                prefixIcon: Icon(Icons.calendar_today),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.zero),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue))),
            readOnly: true,
            onTap: () => _selectDate(context),
          ),
          Row(
            children: [
              const Text('Choose the Category'),
              const SizedBox(
                width: 20,
              ),
              DropdownButton(
                  padding: const EdgeInsets.all(15),
                  value: _selectedCategory,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toUpperCase()),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      if (value == null) {
                        return;
                      }
                      _selectedCategory = value;
                    });

                    print(_selectedCategory.name);
                  }),
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  _submitExpense();
                  print('successfully added expense');
                  Navigator.pop(context);
                },
                child: const Text('Save Expense'),
              )
            ],
          )
        ],
      ),
    );
  }
}
