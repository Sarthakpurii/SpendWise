
import 'package:flutter/material.dart';
import 'package:spend/models/expense_structure.dart';
import 'package:spend/widget/chart/chart_bar.dart';

class Chart extends StatelessWidget{
  Chart(this.expensesData,{super.key});

  List<ExpenseDetails> expensesData;
  
  List<ExpenseBucket> get buckets{
    List<ExpenseBucket> bucketList=[];
    bucketList.add(ExpenseBucket.forCategory(expensesData, Category.Leisure));
    bucketList.add(ExpenseBucket.forCategory(expensesData, Category.Work));
    bucketList.add(ExpenseBucket.forCategory(expensesData, Category.Travel));
    bucketList.add(ExpenseBucket.forCategory(expensesData, Category.Food));
    bucketList.add(ExpenseBucket.forCategory(expensesData, Category.Other));

    return bucketList;
  }

  double get getmaxAmount {
    double max = 0;
    for (final bucket in buckets) {
      if (bucket.totalExpenses > max) max = bucket.totalExpenses;
    }
    return max;
  }


  @override
  Widget build(context){
    final double maxAmount=getmaxAmount;
    return Container(
      height: 180,
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(12,12,12,7),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
      gradient: LinearGradient(colors: [Theme.of(context).colorScheme.primaryContainer,Theme.of(context).colorScheme.primaryContainer.withOpacity(0.6)],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,)
      ,),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6,horizontal: 4),
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [for (final bucket in buckets)
                ChartBar(bucket.totalExpenses/maxAmount)])),
            // SizedBox(height: 0,),




            Expanded(child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [for ( Category c in Category.values) Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23,vertical: 0),
                child: Image.asset('assets/icons/${c.name.toLowerCase()}.png',scale: 20,),
              )],
            )),
            SizedBox(height: 5,)
          ],
        ),
      ),
    );
  }
}