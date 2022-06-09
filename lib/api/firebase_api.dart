import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:productivity_app/notes/note_class.dart';
import 'package:productivity_app/notes/note_utils.dart';
//ignore_for_file: prefer_const_constructors

class FirebaseApi {
  //final user = FirebaseAuth.instance.currentUser!;
  //late final uid = user.uid.toString();

  static String getCurrentUser(){
    final user = FirebaseAuth.instance.currentUser!;
    final uid = user.uid.toString();
    return uid;
  }

  static Future<String> createNote(Note note) async { //static
    //A DOCUMENT WILL STORE ONE NOTE
    //final docNote = FirebaseFirestore.instance.collection('notes').doc();
    final docNote = FirebaseFirestore.instance.collection('users').doc(getCurrentUser())
                                              .collection('notes').doc();
    note.id = docNote.id;

    await docNote.set(note.toJson());

    return docNote.id;
  }

  static Future updateNote(Note note) async{ //static
    final docNote = FirebaseFirestore.instance.collection('users').doc(getCurrentUser())
                                              .collection('notes').doc(note.id);

    await docNote.update(note.toJson());
  }

  static Future deleteNote(Note note) async{ //static
    final docNote = FirebaseFirestore.instance.collection('users').doc(getCurrentUser())
                                              .collection('notes').doc(note.id);

    await docNote.delete();
  }
}