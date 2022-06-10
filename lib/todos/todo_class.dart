import 'todo_utils.dart';

class TodoField {
  static const createdAt = 'createdAt';
}

class Todo {
  String id;
  String title;
  DateTime createdAt;

  Todo({
    this.id ='',
    required this.title,
    required this.createdAt,
  });

  //JSON METHOD FOR STORING IN FIREBASE
  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'createdAt': TodoUtils.fromDateTimeToJson(createdAt),
  };

  //JSON METHOD FOR READING FROM FIREBASE
  static Todo fromJson(Map<String, dynamic> json) => Todo(
    id: json['id'],
    title: json['title'],
    createdAt: TodoUtils.fromJsonToDateTime(json['createdAt']),
  );
}