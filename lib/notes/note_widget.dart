import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'note_class.dart';
import 'package:provider/provider.dart';
import 'package:productivity_app/provider/note_provider.dart';
import 'note_utils.dart';
import 'edit_note_page.dart';
//ignore_for_file: prefer_const_constructors

class NoteWidget extends StatelessWidget {
  //const NoteWidget({Key? key}) : super(key: key);

  final Note note;

  const NoteWidget({
    required this.note,
    Key? key,
}) : super(key: key);

  //SLIDABLE - BUTOANELE PENTRU EDIT & DELETE
  @override
  Widget build(BuildContext context) => Slidable(
    key: Key(note.id),
    startActionPane: ActionPane(
      motion: DrawerMotion(),
      children: [
        SlidableAction(
            onPressed: (context) => editNote(context, note),
            backgroundColor: Colors.lightGreen,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
        ),
      ],
    ),

    child: buildNote(context),  //CONTEXT

    endActionPane: ActionPane(
      motion: DrawerMotion(),
      children: [
        SlidableAction(
          onPressed: (context) => deleteNote(context, note),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        ),
      ],
    ),
  );

  Widget buildNote(BuildContext context) => Container(
    child: Row(
      children: [
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                if(note.description.isNotEmpty)
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      note.description,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      maxLines: 6,
                    ),
                  ),
              ],
            ),
        ),
      ],
    ),
  );

  void editNote(BuildContext context, Note note) => Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => EditNotePage(note: note),
    ),

  );

  void deleteNote (BuildContext context, Note note){
    final provider = Provider.of<NoteProvider>(context, listen: false);
    provider.removeNote(note);

    //DISPLAY MESSAGE
    NoteUtils.showSnackBar(context, 'Note deleted');
  }
}
