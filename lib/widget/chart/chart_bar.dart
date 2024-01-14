
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget{
  ChartBar(this.amount,{super.key});

  double amount;

  @override
  Widget build(context){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,horizontal: 10
        ),
        child: FractionallySizedBox(
          alignment: Alignment.bottomCenter,
          heightFactor: amount,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              shape: BoxShape.rectangle,
              color: Theme.of(context).colorScheme.onPrimaryContainer
              ),
            )
          ),
      ),
    );
  }
}