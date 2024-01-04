import 'package:flutter/material.dart';
import 'package:spend/models/expense_structure.dart';
import 'package:spend/widget/expense-list/expense.dart';

class ExpensesList extends StatelessWidget{
  const ExpensesList(this.expenses,{super.key});

  final List<ExpenseDetails> expenses;

  @override
  Widget build(context){
    return ListView.builder(
      itemCount:expenses.length,
      itemBuilder: (ctx,index)=>Expense(expenses[index]));
  }
}