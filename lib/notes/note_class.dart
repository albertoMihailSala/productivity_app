class Note {
  String id;
  String title;
  String description;

  Note({
    this.id ='',
    required this.title,
    this.description = '',
  });

  //JSON METHOD FOR STORING IN FIREBASE
  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
  };

  //JSON METHOD FOR READING FROM FIREBASE
  static Note fromJson(Map<String, dynamic> json) => Note(
    id: json['id'],
    title: json['title'],
    description: json['description'],
  );
}