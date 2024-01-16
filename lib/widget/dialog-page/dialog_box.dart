import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spend/models/expense_structure.dart';




class DialogPage extends StatefulWidget {
  const DialogPage({super.key, required this.expenseAdder});
  final void Function(ExpenseDetails expense) expenseAdder;


  @override
  State<DialogPage> createState() {
    return _DialogPageState();
  }
}





class _DialogPageState extends State<DialogPage> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  DateTime? _selectedDate=DateTime.now();
  Category _selectedCategory=Category.Other;

  void _dateSelector() async {
    final now = DateTime.now();
    var selectedDate = await showDatePicker(
        context: context,
        firstDate: DateTime(now.year - 1, now.month, now.day),
        lastDate: now,
        currentDate: now);
    setState(() {
      _selectedDate = selectedDate;
    });
  }




  void _submitData(){
    var enteredAmount=double.tryParse(_priceController.text);
    if (_titleController.text.trim().isEmpty){
      showDialog(context: context, builder: (ctx)=> AlertDialog(
        title: const Text('Invalid Title'),
        content: const Text("Title can't be left empty."),
        actions: [
          ElevatedButton(onPressed: (){Navigator.pop(context);}, child: const Text('Okay'))
        ],));
      return;
    }
    else if (enteredAmount==null){
      showDialog(context: context, builder: (ctx)=> AlertDialog(
        title: const Text('Invalid Amount'),
        content: const Text("Amount can't be left empty."),
        actions: [
          ElevatedButton(onPressed: (){Navigator.pop(context);}, child: const Text('Okay'))
        ],));
      return;
    }
    else if (enteredAmount<=0){
      showDialog(context: context, builder: (ctx)=> AlertDialog(
        title: const Text('Invalid Amount'),
        content: const Text("Amount can't be 0 or less than 0."),
        actions: [
          ElevatedButton(onPressed: (){Navigator.pop(context);}, child: const Text('Okay'))
        ],));
      return;
    }
    widget.expenseAdder(ExpenseDetails(date: _selectedDate!, amount: enteredAmount, category: _selectedCategory, title: _titleController.text));
    Navigator.pop(context);
  }





  @override
  void dispose() {
    _priceController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    final keyboardsize=MediaQuery.of(context).viewInsets.bottom;

    return SizedBox(
      height: double.infinity,
      
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16,16,16,keyboardsize+26),
          child: Column(children: [
            TextField(
              maxLength: 25,
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),
              decoration: const InputDecoration(label: Text('Title')),
              controller: _titleController,
            ),
        
        
        
        
            Row(
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),
                    keyboardType: TextInputType.number,
                    controller: _priceController,
                    decoration: const InputDecoration(label: Text('Amount'),
                    prefix: Text('\$ ')),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(DateFormat('dd-MM-yyyy').format(_selectedDate!),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),),
                    const SizedBox(width: 10,),
                    IconButton(
                        onPressed: _dateSelector,
                        icon: const Icon(Icons.calendar_month))
                  ],
                ))
              ],
            ),
        
        
        
        
             const SizedBox(height: 20,),
        
        
            Row(
              children: [
                DropdownButton(
                  style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer,
                                  fontSize: 18),
                    value: _selectedCategory,
                    items: Category.values
                        .map((e) =>DropdownMenuItem(
                              value: e,
                              child: Text(e.name))).toList(),
                    onChanged: (value) {
                      if (value==null) return;
                      setState(() {
                        _selectedCategory=value;
                      });
                    }),
                    const Spacer(),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel')),
                ElevatedButton(onPressed: _submitData, child: const Text('Submit'))
              ],
            )
          ]),
        ),
      ),
    );
  }
}
