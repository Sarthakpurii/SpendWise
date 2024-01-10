import 'package:flutter/material.dart';
import 'package:spend/models/expense_structure.dart';
import 'package:spend/widget/dialog-page/dialog_box.dart';
import 'package:spend/widget/expense-list/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
 





  void expenseAdder(ExpenseDetails e) {
    setState(() {
      dummydata.add(e);
    });
  }

  void expenseDeleter(int e) {
    ExpenseDetails exp = dummydata[e];
    setState(() {
      dummydata.removeAt(e);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: const Text('Expense Deleted'),
      duration: const Duration(seconds: 4),
      action: SnackBarAction(label: 'Undo', onPressed: (){
        setState(() {
          dummydata.insert(e, exp);
        });
      }),)
    );
  }

  void _DialogPage() {
    showModalBottomSheet(
      //  barrierColor: Colors.white.withOpacity(1),
        isScrollControlled: true,
        context: context,
        builder: (ctx) => DialogPage(
              expenseAdder: expenseAdder,
            ));
  }





  final List<ExpenseDetails> dummydata = [
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
  Widget build(context) {
   Widget mainContent=const Center(child: Text('No expenses'),);
    if (dummydata.isNotEmpty){
    mainContent=ExpensesList(
              dummydata,
              expenseDeleter: expenseDeleter,
            );
  }


    return Scaffold(
      appBar: AppBar(
        title: const Text('SpendWise'),
        actions: [
          IconButton(onPressed: _DialogPage, icon: const Icon(Icons.add))
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Chart'),
            Expanded(
                child: mainContent)
          ],
        ),
      ),
    );
  }
}
