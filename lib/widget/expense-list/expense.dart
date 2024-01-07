import 'package:flutter/material.dart';
import 'package:spend/models/expense_structure.dart';
import 'package:intl/intl.dart';

class Expense extends StatelessWidget {
  final ExpenseDetails data;
  
  const Expense(this.data, {super.key});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      child: Card(
        child: Row(
          children: [
            Column(
              children: [
                Text(data.date.day.toString()),
                Text(DateFormat('MMM').format(data.date)),
              ],
            ),
            const SizedBox(width: 5,),
            const Icon(Icons.apple),
            const SizedBox(width: 5,), 
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(data.title),
              Text(DateFormat('h:mm a').format(data.date))
            ],),
            const Spacer(),
            Text('\$${data.amount}')
          ],
        ),
      ),
    );
  }
}