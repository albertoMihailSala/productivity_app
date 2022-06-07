import 'package:flutter/material.dart';
import 'package:productivity_app/provider/note_provider.dart';
import 'package:provider/provider.dart';
import 'add_note_popup.dart';
import 'note_list_widget.dart';
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
        body: NoteListWidget(),

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
}
