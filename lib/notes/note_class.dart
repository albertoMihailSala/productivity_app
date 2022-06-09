import 'note_utils.dart';
class NoteField {
  static const createdAt = 'createdAt';
}

class Note {
  String id;
  String title;
  String description;
  DateTime createdAt;

  Note({
    this.id ='',
    required this.title,
    this.description = '',
    required this.createdAt,
  });

  //JSON METHOD FOR STORING IN FIREBASE
  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'createdAt': NoteUtils.fromDateTimeToJson(createdAt),
  };

  //JSON METHOD FOR READING FROM FIREBASE
  static Note fromJson(Map<String, dynamic> json) => Note(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    createdAt: NoteUtils.fromJsonToDateTime(json['createdAt']),
  );
}