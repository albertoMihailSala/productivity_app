import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:productivity_app/provider/todo_provider.dart';
import 'todo_widget.dart';
//ignore_for_file: prefer_const_constructors

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

        //separatorBuilder: (context, index) => Container(height: 15),
        separatorBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 25),
          child:DottedLine(
            dashColor: Colors.black,
            lineThickness: 7,
            dashLength: 50,
            dashRadius: 60,
            dashGapLength: 12,
            dashGradient: [Theme.of(context).colorScheme.background, Theme.of(context).colorScheme.primary],
          ),
        ),

        itemCount: todos.length);
  }
}