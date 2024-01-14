import 'package:uuid/uuid.dart';

const uuid=Uuid();
enum Category {Food, Travel, Leisure, Work, Other}
class ExpenseDetails{
  ExpenseDetails({required this.date,required this.amount,required this.category, required this.title}): id=uuid.v4();

  final String id;
  double amount;
  String title;
  final DateTime date;
  final Category category;
}


class ExpenseBucket{
  const ExpenseBucket(this.category,this.expenses);

  final Category category;
  final List<ExpenseDetails> expenses;

  ExpenseBucket.forCategory(List<ExpenseDetails> elist, this.category) : expenses=elist.where((e)=>e.category==category).toList();

  double get totalExpenses{
    double sum=0;

    for (final e in expenses){
      sum+=e.amount;
    }
    return sum;
  }
}