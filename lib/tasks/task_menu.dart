import 'package:flutter/material.dart';
import 'package:productivity_app/tasks/task_list_widget.dart';
import 'add_task_popup.dart';
//ignore_for_file: prefer_const_constructors

class TaskMenu extends StatefulWidget {
  const TaskMenu({Key? key}) : super(key: key);

  @override
  State<TaskMenu> createState() => _TaskMenuState();
}

class _TaskMenuState extends State<TaskMenu> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Tasks',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.indigo.shade900,
    ),
    body: TaskListWidget(),
    floatingActionButton: FloatingActionButton(
      onPressed: () => showDialog(
        context: context,
        builder: (BuildContext context) => AddTaskPopup(),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.deepPurple,
      //When long-pressed, button displays this text
      tooltip: 'Add',
      //Icon
      child: Icon(Icons.add),
    ),
  );
}
