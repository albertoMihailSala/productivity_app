import 'package:flutter/material.dart';
import 'todo_class.dart';
import 'todo_form_widget.dart';
import 'package:provider/provider.dart';
import 'package:productivity_app/provider/todo_provider.dart';
import 'todo_utils.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;

  const EditTodoPage({
    Key? key,
    required this.todo
  }) : super(key: key);

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  String title ='';

  final _formKey = GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();
    //TAKE THE CURRENT TITLE, PRIORITY & DESCRIPTION
    title = widget.todo.title;
  }

  @override
  Widget build(BuildContext context) => Scaffold (
    appBar: AppBar(
      title: Text('Edit list name'),
    ),
    body: Padding(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: TodoFormWidget(
          title: title,
          onChangedTitle: (title) => setState(() => this.title = title),
          onSavedTodo: saveEditedTodo,
        ),
      ),
    ),
  );

  void saveEditedTodo() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid){
      return;
    }
    else {
      final provider = Provider.of<TodoProvider>(context, listen: false);

      provider.updateTodo(widget.todo, title);

      //EXIT EDIT PAGE AFTER UPDATE
      Navigator.of(context).pop();
      //DISPLAY MESSAGE
      TodoUtils.showSnackBar(context, 'Saved changes');

    }
  }
}

