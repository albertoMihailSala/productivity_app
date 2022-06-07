import 'package:flutter/material.dart';
import 'package:productivity_app/notes/note_class.dart';
//ignore_for_file: prefer_const_constructors

class NoteProvider extends ChangeNotifier {
  List<Note> _notes = [
    Note(
      title: 'First Note',
      description: 'Captains Journal. So far, the progress on the app is good.'
    ),
    Note(
      title: 'Second Note',
    ),
  ];

  List<Note> get notes => _notes.toList();

  void addNote(Note note){
    _notes.add(note);
    //PROVIDER UPDATES UI
    notifyListeners();
  }

  void removeNote(Note note){
    _notes.remove(note);

    notifyListeners();
  }

  //EDIT NOTE
  void updateNote(Note note, String title, String description) {
    note.title = title;
    note.description = description;

    notifyListeners();
  }
}