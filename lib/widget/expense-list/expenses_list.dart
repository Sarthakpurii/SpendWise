import 'package:flutter/material.dart';
import 'package:spend/models/expense_structure.dart';
import 'package:spend/widget/expense-list/expense/expense.dart';

class ExpensesList extends StatelessWidget{
  ExpensesList(this.expenses,{super.key,required this.expenseDeleter});

  final List<ExpenseDetails> expenses;
    void Function(ExpenseDetails expense) expenseDeleter;

  @override
  Widget build(context){
    return ListView.builder(
      itemCount:expenses.length,
      itemBuilder: (ctx,index)=>Dismissible(key: ValueKey(expenses[index]),
      child:Expense(expenses[index]),
      onDismissed: (direction) => expenseDeleter(expenses[index]),));
  }
}