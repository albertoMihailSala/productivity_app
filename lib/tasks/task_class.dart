import 'task_utils.dart';
//FIELD WILL BE USED IN FIREBASE QUERY FOR ORDERBY
class TaskField {
  static const createdAt = 'createdAt';
}
class Task {
  String id;
  String todoId;
  String title;
  String? priority;
  String? category;
  DateTime createdAt;

  Task({
    this.id = '',
    this.todoId = '',
    required this.title,
    required this.priority,
    required this.category,
    required this.createdAt,
  });

  //JSON METHOD FOR STORING IN FIREBASE
  Map<String, dynamic> toJson() => {
    'id': id,
    'todoId': todoId,
    'title': title,
    'priority': priority,
    'category': category,
    'createdAt': TaskUtils.fromDateTimeToJson(createdAt),
  };

  //JSON METHOD FOR READING FROM FIREBASE
  static Task fromJson(Map<String, dynamic> json) => Task(
    id: json['id'],
    todoId: json['todoId'],
    title: json['title'],
    priority: json['priority'],
    category: json['category'],
    createdAt: TaskUtils.fromJsonToDateTime(json['createdAt']),
  );
}