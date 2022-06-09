import 'package:flutter/material.dart';
import 'package:productivity_app/tasks/task_class.dart';
import 'package:productivity_app/api/firebase_api.dart';
//ignore_for_file: prefer_const_constructors

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [
    Task(
      title: 'First task',
      priority: 'High',
      category: 'Personal',
      createdAt: DateTime.now(),
    ),
    Task(
      title: 'Second task',
      priority: 'Medium',
      category: 'Work',
      createdAt: DateTime.now(),
    ),
    Task(
      title: 'Third task',
      priority: 'Low',
      category: 'Other',
      createdAt: DateTime.now(),
    ),
  ];

  //GETTER
  List<Task> get tasks => _tasks.toList();

}