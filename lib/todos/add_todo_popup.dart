import 'package:flutter/material.dart';
import 'todo_form_widget.dart';
import 'todo_class.dart';
import 'package:provider/provider.dart';
import 'package:productivity_app/provider/todo_provider.dart';

class AddTodoPopup extends StatefulWidget {
  const AddTodoPopup({Key? key}) : super(key: key);

  @override
  State<AddTodoPopup> createState() => _AddTodoPopupState();
}

class _AddTodoPopupState extends State<AddTodoPopup> {
  //GLOBAL KEY TO VALIDATE TITLE
  final _formKey = GlobalKey<FormState>();
  String title = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
    content: Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'New List',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          TodoFormWidget(
            onChangedTitle: (title) => setState(() => this.title = title),
            onSavedTodo: addTodo,
          ),
        ],
      ),
    ),
  );

  void addTodo() {
    final isValid = _formKey.currentState!.validate();

    if(!isValid){
      return;
    }
    else {
      final newTodo = Todo(
        id: DateTime.now().toString(),
        title: title,
        createdAt: DateTime.now(),
      );
      final provider = Provider.of<TodoProvider>(context, listen: false);
      provider.addTodo(newTodo);
      //HIDE ALERT DIALOG
      Navigator.of(context).pop();
    }
  }
}
