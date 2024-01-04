
import 'package:flutter/material.dart';
import 'package:spend/models/expense_structure.dart';
import 'package:spend/widget/expense-list/expenses_list.dart';

class Expenses extends StatefulWidget{
  const Expenses({super.key});

  @override
  State<Expenses> createState(){
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses>{
  final List<ExpenseDetails> dummydata=[
    ExpenseDetails(
    date: DateTime.now(),
    amount: 19.99, 
    category: Category.Food, 
    title: 'Pizza'),
    ExpenseDetails(
    date: DateTime.now(),
    amount: 77.80, 
    category: Category.Leisure, 
    title: 'Netflix')
    ];
  @override
  Widget build(context){
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Chart'),
          Expanded(child: ExpensesList(dummydata))
        ],
      ),
    );
  }
}