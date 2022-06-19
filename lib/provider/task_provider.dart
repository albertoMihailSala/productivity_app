import 'package:flutter/material.dart';
import 'package:productivity_app/tasks/task_class.dart';
import 'package:productivity_app/api/firebase_api.dart';
//ignore_for_file: prefer_const_constructors

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];

  //GETTER
  List<Task> get tasks => _tasks.toList();

  void addTask(Task task) => FirebaseApi.createTask(task);

  void setTasks(List<Task> tasks) =>
      //NE ASIGURĂM CĂ NU ESTE CHEMATĂ ÎN TIMPUL METODEI DE BUILD
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _tasks = tasks;
        notifyListeners();
  });

  void removeTask(Task task) => FirebaseApi.removeTask(task);

  void updateTask(Task task, String title, String? priority, String? category) {
    task.title = title;
    task.priority = priority;
    task.category = category;

    FirebaseApi.updateTask(task);
  }
}