import 'package:flutter/material.dart';
import 'task_widget.dart';
import 'package:provider/provider.dart';
import 'package:productivity_app/provider/task_provider.dart';
//ignore_for_file: prefer_const_constructors

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //INSTANCE OF PROVIDER
    final provider = Provider.of<TaskProvider>(context);
    final tasks = provider.tasks;

    return tasks.isEmpty
        ? Center(
      child: Text(
        'START ADDING TASKS!',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    )
        : ListView.separated(
      //BOUNCING EFFECT
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final task = tasks[index];

          return TaskWidget(task: task);
        },

        separatorBuilder: (context, index) => Container(height: 15),

        itemCount: tasks.length);
  }
}
