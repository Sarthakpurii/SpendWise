import 'package:flutter/material.dart';
import 'package:spend/models/expense_structure.dart';
import 'package:spend/widget/expense-list/expense/expense.dart';

class ExpensesList extends StatelessWidget{
  const ExpensesList(this.expenses,{super.key,required this.expenseDeleter});

  final List<ExpenseDetails> expenses;
  final void Function(int i) expenseDeleter;


  @override
  Widget build(context){
    return ListView.builder(
      itemCount:expenses.length,
      itemBuilder: (ctx,index)=>Dismissible(key: ValueKey(expenses[index]),
      background: Container(decoration: BoxDecoration(color: Colors.blueGrey.withOpacity(0.75),
      borderRadius: BorderRadius.circular(10)),
      child: Row(mainAxisAlignment: MainAxisAlignment.end,
      children: [Image.asset('assets/icons/delete.png',scale: 14,color: Theme.of(context).textTheme.bodyMedium!.color,),const SizedBox(width: 10,)],),),
      child:Expense(expenses[index]),
      onDismissed: (direction) => expenseDeleter(index),));
  }
}