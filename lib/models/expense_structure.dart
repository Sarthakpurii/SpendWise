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