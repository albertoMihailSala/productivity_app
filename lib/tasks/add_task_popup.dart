import 'package:flutter/material.dart';
import 'task_form_widget.dart';
//ignore_for_file: prefer_const_constructors

class AddTaskPopup extends StatefulWidget {
  const AddTaskPopup({Key? key}) : super(key: key);

  @override
  State<AddTaskPopup> createState() => _AddTaskPopupState();
}

class _AddTaskPopupState extends State<AddTaskPopup> {
  //GLOBAL KEY TO VALIDATE TITLE
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String? priority = 'High';
  String? category = 'Personal'; //Work / Family / Personal / Other

  @override
  Widget build(BuildContext context) => AlertDialog(
    content: Column(
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
          onSavedTask: () {},
        ),
      ],
    ),
  );
}
