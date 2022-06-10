import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:productivity_app/api/firebase_api.dart';
import 'package:flutter/material.dart';
import 'add_task_popup.dart';
import 'package:provider/provider.dart';
import 'package:productivity_app/provider/task_provider.dart';
import 'task_class.dart';
import 'task_list_widget.dart';
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

    body: StreamBuilder<List<Task>>(
        stream: readTasks(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            //INDICATOR DE LOADING CÂT TIMP SUNT EXTRASE NOTIȚELE
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasData) {
                final notes = snapshot.data;

                final provider = Provider.of<TaskProvider>(context);
                provider.setTasks(notes!);
              }
          }
          return TaskListWidget();
        }
    ),

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

  //STREAM-UL PENTRU CITIREA TASK-URILOR DIN FIREBASE
  Stream<List<Task>> readTasks() =>
      FirebaseFirestore.instance.collection('users').doc(FirebaseApi.getCurrentUser()).collection('tasks')
          .orderBy(TaskField.createdAt, descending: true)
          .snapshots()
          .map((snapshot) =>
          snapshot.docs.map((doc) => Task.fromJson(doc.data())).toList());
}
