import 'package:flutter/material.dart';
import 'todo_class.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'todo_utils.dart';
import 'package:provider/provider.dart';
import 'package:productivity_app/provider/todo_provider.dart';
import 'edit_todo_page.dart';
import 'package:productivity_app/tasks/task_menu.dart';
//ignore_for_file: prefer_const_constructors

class TodoWidget extends StatelessWidget {
  //const NoteWidget({Key? key}) : super(key: key);

  final Todo todo;

  const TodoWidget({
    required this.todo,
    Key? key,
  }) : super(key: key);

  //SLIDABLE - BUTOANELE PENTRU EDIT & DELETE
  @override
  Widget build(BuildContext context) =>
      Slidable(
        key: Key(todo.id),
        startActionPane: ActionPane(
          motion: DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (context) => editTodo(context, todo),
              backgroundColor: Colors.lightGreen,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),
          ],
        ),

        child: buildTodo(context), //CONTEXT

        endActionPane: ActionPane(
          motion: DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (context) => deleteTodo(context, todo),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
      );

  Widget buildTodo(BuildContext context) => InkWell(
    onTap: () => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TaskMenu(todo: todo)),
    ),
    child:  Container(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                      color: Theme
                          .of(context)
                          .colorScheme
                          .secondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
    ),
  );

  void editTodo(BuildContext context, Todo todo) => Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => EditTodoPage(todo: todo),
    ),
  );

  void deleteTodo(BuildContext context, Todo todo){
    final provider = Provider.of<TodoProvider>(context, listen: false);
    provider.removeTodo(todo);

    //DISPLAY MESSAGE
    TodoUtils.showSnackBar(context, 'List deleted');
  }
}