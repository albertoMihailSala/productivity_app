import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'add_note_popup.dart';
import 'note_list_widget.dart';
import 'note_class.dart';
import 'package:provider/provider.dart';
import 'package:productivity_app/provider/note_provider.dart';
//ignore_for_file: prefer_const_constructors

class NoteMenu extends StatefulWidget {
  //const NoteMenu({Key? key}) : super(key: key);

  @override
  State<NoteMenu> createState() => _NoteMenuState();
}

//The page where all notes are displayed
class _NoteMenuState extends State<NoteMenu> {

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Notes',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
         body: StreamBuilder<List<Note>>(
           stream: readNotes(),
           builder: (context, snapshot) {
             switch (snapshot.connectionState) {
               case ConnectionState.waiting:
                 //INDICATOR DE LOADING CÂT TIMP SUNT EXTRASE NOTIȚELE
                 return Center(child: CircularProgressIndicator());
               default:
                if (snapshot.hasData) {
                  final notes = snapshot.data;

                  final provider = Provider.of<NoteProvider>(context);
                  provider.setNotes(notes!);
                }
              }
             return NoteListWidget();
           }
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => showDialog(
                context: context,
               builder: (BuildContext context) => AddNotePopup(),
           ),
            //When long-pressed, button displays this text
            tooltip: 'Add',
            //Icon
            child: Icon(Icons.add),
        ),
      );

  //STREAM-UL PENTRU CITIREA NOTIȚELOR DIN FIREBASE
  Stream<List<Note>> readNotes() =>
      FirebaseFirestore.instance.collection('notes').snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => Note.fromJson(doc.data())).toList());
}
