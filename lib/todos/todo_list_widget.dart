import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:productivity_app/provider/todo_provider.dart';
import 'todo_widget.dart';

class TodoListWidget extends StatelessWidget {
  //const NoteListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context);
    final todos = provider.todos;

    return todos.isEmpty
        ? Center(
      child: Text(
        'THERE ARE NO LISTS YET',
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
          final todo = todos[index];

          return TodoWidget(todo: todo);
        },

        separatorBuilder: (context, index) => Container(height: 25),

        itemCount: todos.length);
  }
}