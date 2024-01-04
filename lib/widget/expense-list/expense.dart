import 'package:flutter/material.dart';
import 'package:spend/models/expense_structure.dart';
import 'package:intl/intl.dart';

class Expense extends StatelessWidget {
  final ExpenseDetails data;
  
  const Expense(this.data, {super.key});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Card(
        child: Row(
          children: [
            Column(
              children: [
                Text(data.date.day.toString()),
                Text(DateFormat('MMM').format(data.date)),
              ],
            ),
            const Icon(Icons.apple), // Icons.apple should be a placeholder for an actual icon
          ],
        ),
      ),
    );
  }
}