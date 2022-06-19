import 'package:flutter/material.dart';
import 'package:productivity_app/notes/note_class.dart';
import 'package:productivity_app/api/firebase_api.dart';
//ignore_for_file: prefer_const_constructors

class NoteProvider extends ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get notes => _notes.toList();

  /* LOCAL
  void addNote(Note note){
    _notes.add(note);
    //PROVIDER UPDATES UI
    notifyListeners();
  } */

  //DATA WILL BE STORED LOCALLY AND IN FIREBASE
  void addNote(Note note) => FirebaseApi.createNote(note);

  //ADAUGĂ NOTIȚELE ÎN LISTA DIN PROVIDER
  void setNotes(List<Note> notes) =>
     //NE ASIGURĂM CĂ NU ESTE CHEMATĂ ÎN TIMPUL METODEI DE BUILD
      WidgetsBinding.instance.addPostFrameCallback((_) {
       _notes = notes;
       notifyListeners();
     });

  void removeNote(Note note) => FirebaseApi.deleteNote(note);
    //_notes.remove(note);
    //notifyListeners();

  //EDIT NOTE
  void updateNote(Note note, String title, String description) {
    note.title = title;
    note.description = description;

    //notifyListeners();
    FirebaseApi.updateNote(note);
  }
}