import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:productivity_app/api/firebase_api.dart';
import 'package:flutter/material.dart';
import 'package:productivity_app/todos/todo_list_widget.dart';
import 'add_todo_popup.dart';
import 'package:provider/provider.dart';
import 'package:productivity_app/provider/todo_provider.dart';
import 'todo_class.dart';
//ignore_for_file: prefer_const_constructors

class TodoMenu extends StatefulWidget {
  const TodoMenu({Key? key}) : super(key: key);

  @override
  State<TodoMenu> createState() => _TodoMenuState();
}

class _TodoMenuState extends State<TodoMenu> {
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: Text('Lists',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        body: StreamBuilder<List<Todo>>(
            stream: readTodos(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                //INDICATOR DE LOADING CÂT TIMP SUNT EXTRASE NOTIȚELE
                  return Center(child: CircularProgressIndicator());
                default:
                  if (snapshot.hasData) {
                    final todos = snapshot.data;

                    final provider = Provider.of<TodoProvider>(context);
                    provider.setTodos(todos!);
                  }
              }
              return TodoListWidget();
            }
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              showDialog(
                context: context,
                builder: (BuildContext context) => AddTodoPopup(),
              ),
          //When long-pressed, button displays this text
          tooltip: 'Add',
          //Icon
          child: Icon(Icons.add),
        ),
      );

  //STREAM-UL PENTRU CITIREA TODOS DIN FIREBASE
  Stream<List<Todo>> readTodos() =>
      FirebaseFirestore.instance.collection('users').doc(FirebaseApi.getCurrentUser()).collection('lists')
          .orderBy(TodoField.createdAt, descending: true)
          .snapshots()
          .map((snapshot) =>
          snapshot.docs.map((doc) => Todo.fromJson(doc.data())).toList());
}

