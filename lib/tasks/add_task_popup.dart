import 'package:flutter/material.dart';
import 'task_form_widget.dart';
import 'task_class.dart';
import 'package:provider/provider.dart';
import 'package:productivity_app/provider/task_provider.dart';
import 'package:productivity_app/todos/todo_class.dart';
//ignore_for_file: prefer_const_constructors

class AddTaskPopup extends StatefulWidget {
  //const AddTaskPopup({Key? key}) : super(key: key);
  final Todo todo;

  AddTaskPopup({
    Key? key,
    required this.todo,
  }): super(key: key);

  @override
  State<AddTaskPopup> createState() => _AddTaskPopupState();
}

class _AddTaskPopupState extends State<AddTaskPopup> {
  //GLOBAL KEY TO VALIDATE TITLE; IT ACCESSES THE VALIDATOR FROM THE FORM
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String? priority = 'High';
  String? category = 'Personal'; //Work / Family / Personal / Other

  @override
  Widget build(BuildContext context) => AlertDialog(
    content: Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'New Task',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TaskFormWidget(
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedPriority: (priority) => setState(() => this.priority = priority),
            onChangedCategory: (category) => setState(() => this.category = category),
            onSavedTask: addTask,
          ),
        ],
      ),
    ),
  );

  void addTask() {
    //VALIDATE CALLS THE VALIDATOR FROM THE FORM
    final isValid = _formKey.currentState!.validate();

    if(!isValid){
      return;
    }
    else {
      final newTask = Task(
        id: DateTime.now().toString(),
        todoId: widget.todo.id,
        title: title,
        priority: priority,
        category: category,
        createdAt: DateTime.now(),
      );
      //CALL ON THE PROVIDER
      final provider = Provider.of<TaskProvider>(context, listen: false);
      provider.addTask(newTask);
      //HIDE ALERT DIALOG
      Navigator.of(context).pop();
    }
  }
}
