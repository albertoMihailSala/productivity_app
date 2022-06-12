import 'package:flutter/material.dart';
import 'package:productivity_app/todos/todo_class.dart';
import 'package:productivity_app/api/firebase_api.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos.toList();

  void addTodo(Todo todo) => FirebaseApi.createTodo(todo);

  void setTodos(List<Todo> todos) =>
      //NE ASIGURĂM CĂ NU ESTE CHEMATĂ ÎN TIMPUL METODEI DE BUILD
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        _todos = todos;
        notifyListeners();
  });

  void removeTodo(Todo todo) {
    //FIRST REMOVE LIST CONTENT
    FirebaseApi.removeTodoContent(todo);
    //THEN REMOVE THE LIST ITSELF
    FirebaseApi.removeTodo(todo);
  }

  void updateTodo(Todo todo, String title) {
    todo.title = title;

    FirebaseApi.updateTodo(todo);
  }
}