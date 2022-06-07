import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'note_widget.dart';
import 'package:productivity_app/provider/note_provider.dart';
//ignore_for_file: prefer_const_constructors

class NoteListWidget extends StatelessWidget {
  //const NoteListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NoteProvider>(context);
    final notes = provider.notes;

    return notes.isEmpty
      ? Center(
      child: Text(
        'THE NOTE LIST IS EMPTY',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
            ),
          ),
      )
      : ListView.separated(
          //BOUNCING EFFECT
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(16),
          itemBuilder: (context, index) {
            final note = notes[index];

            return NoteWidget(note: note);
          },
          separatorBuilder: (context, index) => Container(height: 25),
          itemCount: notes.length);

  }
}
