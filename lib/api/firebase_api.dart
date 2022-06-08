import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:productivity_app/notes/note_class.dart';
import 'package:productivity_app/notes/note_utils.dart';
//ignore_for_file: prefer_const_constructors

class FirebaseApi {
  static Future<String> createNote(Note note) async {
    //A DOCUMENT WILL STORE ONE NOTE
    final docNote = FirebaseFirestore.instance.collection('notes').doc();

    note.id = docNote.id;

    await docNote.set(note.toJson());

    return docNote.id;
  }

  static Future updateNote(Note note) async{
    final docNote = FirebaseFirestore.instance.collection('notes').doc(note.id);

    await docNote.update(note.toJson());
  }

  static Future deleteNote(Note note) async{
    final docNote = FirebaseFirestore.instance.collection('notes').doc(note.id);

    await docNote.delete();
  }
}