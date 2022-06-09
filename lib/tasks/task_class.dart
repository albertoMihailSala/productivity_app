
//FIELD WILL BE USED IN FIREBASE QUERY FOR ORDERBY
class TaskField {
  static const createdAt = 'createdAt';
}
class Task {
  String id;
  String title;
  String? priority;
  String? category;
  DateTime createdAt;

  Task({
    this.id ='',
    required this.title,
    required this.priority,
    required this.category,
    required this.createdAt,
  });
}