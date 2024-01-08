
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DialogPage extends StatefulWidget{
  DialogPage({super.key});

  @override
  State<DialogPage> createState(){
    return _DialogPageState();
  }
}

class _DialogPageState extends State<DialogPage>{
  final _titleController=TextEditingController();
  final _priceController=TextEditingController();
  DateTime? _selectedDate;

  void _dateSelector() async {
    final now=DateTime.now();
    var selectedDate=await showDatePicker(context: context, firstDate: DateTime(now.year-1,now.month,now.day), lastDate: now,currentDate: now);
    _selectedDate=selectedDate;
  }
  @override
  void dispose(){
    _priceController.dispose();
    _titleController.dispose();
    super.dispose();
  }
  @override
  Widget build(context){
    return Padding(padding: const EdgeInsets.all(16),
    child: Column(children: [
      TextField(maxLength: 25,
      decoration: const InputDecoration(label: Text('Title')),
      controller: _titleController,),
      Row(children: [
        Expanded(
          child: TextField(keyboardType: TextInputType.number,
                controller: _priceController,
                decoration: const InputDecoration(label: Text('Amount')),),
        ),
      Expanded(child: Row(children: [
        const Text('Selected Date'),
        IconButton(onPressed: _dateSelector, icon: const Icon(Icons.calendar_month))
      ],))
      ],),
      Row(children: [
        ElevatedButton(onPressed: (){Navigator.pop(context);}, child: const Text('Cancel')),
        ElevatedButton(onPressed: (){print(DateFormat('dd-MM-yyyy').format(_selectedDate!)); }, child: const Text('Submit'))
      ],)
    ]),);
  }
}