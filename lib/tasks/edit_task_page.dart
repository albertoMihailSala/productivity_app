import 'package:flutter/material.dart';
import 'task_class.dart';
import 'task_form_widget.dart';
import 'package:provider/provider.dart';
import 'package:productivity_app/provider/task_provider.dart';
import 'task_utils.dart';
//ignore_for_file: prefer_const_constructors

class EditTaskPage extends StatefulWidget {
  final Task task;

  const EditTaskPage({
    Key? key,
    required this.task
  }) : super(key: key);

  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  String title ='';
  String? priority = 'High';
  String? category = 'Personal';

  final _formKey = GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();
    //TAKE THE CURRENT TITLE, PRIORITY & DESCRIPTION
    title = widget.task.title;
    priority = widget.task.priority;
    category = widget.task.category;
  }

  @override
  Widget build(BuildContext context) => Scaffold (
    appBar: AppBar(
      title: Text('Update task'),
      backgroundColor: Colors.indigo.shade900,
    ),
    body: Padding(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: TaskFormWidget(
          title: title,
          priority: priority,
          category: category,
          onChangedTitle: (title) => setState(() => this.title = title),
          onChangedPriority: (priority) =>
              setState(() => this.priority = priority),
          onChangedCategory: (category) =>
              setState(() => this.category = category),
          onSavedTask: saveEditedTask,
        ),
      ),
    ),
  );

  void saveEditedTask() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid){
      return;
    }
    else {
      final provider = Provider.of<TaskProvider>(context, listen: false);

      provider.updateTask(widget.task, title, priority, category);

      //EXIT EDIT PAGE AFTER UPDATE
      Navigator.of(context).pop();
      //DISPLAY MESSAGE
      TaskUtils.showSnackBar(context, 'Task updated');

    }
  }
}

