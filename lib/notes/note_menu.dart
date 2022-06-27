import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../api/firebase_api.dart';
import 'add_note_popup.dart';
import 'note_list_widget.dart';
import 'note_class.dart';
import 'package:provider/provider.dart';
import 'package:productivity_app/provider/note_provider.dart';
import 'package:productivity_app/navigation/nav_option.dart';
import 'package:productivity_app/navigation/nav_menu.dart';
import 'package:productivity_app/todos/todo_menu.dart';
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
          /*
          actions: [
            PopupMenuButton<NavOption>(
              itemBuilder: (context) => [
                ...NavMenu.nav2.map(buildOption).toList(),
              ],
              onSelected: (option) => onSelected(context, option),
            ),
          ],
          */
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
      FirebaseFirestore.instance.collection('users').doc(FirebaseApi.getCurrentUser()).collection('notes')
          .orderBy(NoteField.createdAt, descending: true)
          .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => Note.fromJson(doc.data())).toList());

  /*
  PopupMenuItem<NavOption> buildOption(NavOption option) => PopupMenuItem<NavOption>(
    value: option,
    child: Text(option.text),
  );

  void onSelected(BuildContext context, NavOption option){
    switch(option){
      case NavMenu.lists:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TodoMenu()),
        );
        break;
      case NavMenu.signOut:
        FirebaseAuth.instance.signOut();
        break;
    }
  }
  */
}
