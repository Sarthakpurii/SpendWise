import 'package:flutter/material.dart';
import 'package:spend/models/expense_structure.dart';
import 'package:spend/widget/chart/chart.dart';
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
      useSafeArea: true,
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

  final width=MediaQuery.of(context).size.width;
  print(width);

  Widget mainContent=Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children:[Padding(
      padding: const EdgeInsets.fromLTRB(26,0,0,0),
      child: Image.asset('assets/icons/empty.png',scale: 4,color: Theme.of(context).textTheme.bodyMedium!.color,),
    ),
              const SizedBox(height: 12,),
              const Text('No expenses',
              textAlign: TextAlign.start,)]
   );
    if (dummydata.isNotEmpty){
    mainContent=width<500?Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Chart(dummydata),
            Expanded(
                child: ExpensesList(
              dummydata,
              expenseDeleter: expenseDeleter,
            ))
          ],
        ):Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Chart(dummydata)),
            Expanded(
                child: ExpensesList(
              dummydata,
              expenseDeleter: expenseDeleter,
            ))
          ],
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
        child: mainContent,
      ),
    );
  }
}
